job "bulkchecker-service" {
  datacenters = ["dc1"]
  type        = "service"
  constraint {
    attribute = "${meta.node_type}"
    value     = "data_analysis"
  }
  group "bulkchecker_service" {
    count = 1
    restart {
      attempts = 1
      interval = "5m"
      delay    = "15s"
      mode     = "fail"
    }
    task "bulkchecker-service" {
      driver = "raw_exec"
      config {
        command = "/bin/bash"
        args    = [
          "-c",
          "exec /opt/shared/software/python.service.py"
        ]
      }
      logs {
        max_files     = 10
        max_file_size = 15
      }
      resources {
        memory = 256
      }
      service {
        name = "bulkchecker-service"
        check {
          type     = "script"
          name     = "${NOMAD_TASK_NAME} alive"
          command  = "bash"
          args     = ["-c", "exec /opt/shared/software/example.check.sh"]
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}