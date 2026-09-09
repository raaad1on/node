variable "TAG" {
    default = "dev"
}

variable "REGISTRIES" {
    default = ["ghcr.io/raaad1on/remnanode"]
}

variable "XRAY_CORE_VERSION" {
    default = "v26.9.9"
}

variable "UPSTREAM_REPO" {
    default = "XTLS"
}

variable "VARIANTS" {
    default = {
        plain = {
            integrations = ""
            suffix       = ""
        }
    }
}

target "node" {
    name = variant

    matrix = {
        variant = ["plain"]
    }

    context    = "."
    dockerfile = "docker/Dockerfile"
    platforms  = ["linux/amd64", "linux/arm64"]

    args = {
        INTEGRATIONS     = VARIANTS[variant].integrations
        XRAY_CORE_VERSION = XRAY_CORE_VERSION
        UPSTREAM_REPO    = UPSTREAM_REPO
    }

    tags = [
        for registry in REGISTRIES : "${registry}:${TAG}${VARIANTS[variant].suffix}"
    ]
}

group "default" {
    targets = ["plain"]
}
