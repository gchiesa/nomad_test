job "scheduler-dataloader-rabo" {
  datacenters = ["dc1"]
  type        = "batch"

  constraint {
    attribute = "${meta.node_type}"
    value     = "dataloader"
  }

  periodic {
    cron             = "@hourly"
    prohibit_overlap = true
  }

  group "rabobank_siebel" {
    count = 1

    restart {
      attempts = 2
      interval = "5m"
      delay    = "15s"
      mode     = "fail"
    }

    task "siebel" {
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

  group "rabobank_ada" {

    task "ada_in" {
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

    task "ada_out" {
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

    task "ada_clean" {
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