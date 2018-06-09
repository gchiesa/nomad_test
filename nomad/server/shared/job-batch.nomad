job "scheduler-dataloader-rabo" {
  datacenters = ["dc1"]
  type        = "batch"

  constraint {
    attribute = "${meta.node_type}"
    value     = "dataloader_rabo"
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
          "-c",
          "exec /opt/shared/software/python.batch.py"
        ]
      }
      resources {
        memory = 512
      }
    }
  }

  group "rabobank_ada" {

    restart {
      attempts = 2
      interval = "5m"
      delay    = "15s"
      mode     = "fail"
    }

    task "ada_in" {
      driver = "raw_exec"
      config {
        command = "/bin/bash"
        args    = [
          "-c",
          "exec /opt/shared/software/python.batch.py"
        ]
      }
      resources {
        memory = 10
      }
    }

    task "ada_out" {
      driver = "raw_exec"
      config {
        command = "/bin/bash"
        args    = [
          "-c",
          "exec /opt/shared/software/python.batch.py"
        ]
      }
      resources {
        memory = 10
      }
    }
  }

  group "rabobank_cleanup" {

    restart {
      attempts = 2
      interval = "5m"
      delay    = "15s"
      mode     = "fail"
    }

    task "ada_clean" {
      driver = "raw_exec"
      config {
        command = "/bin/bash"
        args    = [
          "-c",
          "exec /opt/shared/software/python.batch.py"
        ]
      }
      resources {
        memory = 512
      }
    }
  }

}