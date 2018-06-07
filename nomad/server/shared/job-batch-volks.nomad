job "scheduler-dataloader-volksbank" {
  datacenters = ["dc1"]
  type        = "batch"

  constraint {
    attribute = "${meta.node_type}"
    value     = "dataloader_volksbank"
  }

  periodic {
    cron             = "@hourly"
    prohibit_overlap = true
  }

  group "volksbank" {
    count = 1

    restart {
      attempts = 2
      interval = "5m"
      delay    = "15s"
      mode     = "fail"
    }

    task "dataloader" {
      driver = "raw_exec"
      config {
        command = "/bin/bash"
        args    = [
          "-x",
          "/opt/shared/software/example.batch.sh"
        ]
      }
      resources {
        memory = 512
      }
    }
  }
}