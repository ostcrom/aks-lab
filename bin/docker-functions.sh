#!/bin/bash

function terraform {
  local docker_envs=()
  local args=()

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --ENV)
        shift
        docker_envs+=("-e" "$1")
        shift
        ;;
      *)
        args+=("$1")
        shift
        ;;
    esac
  done


  docker run -ti --rm \
     -v $(pwd):/apps \
     -w /apps \
     -v ~/.ssh:/root/.ssh \
     -v /etc/hosts:/etc/hosts \
     --user $UID:$GID \
     "${docker_envs[@]}" \
     hashicorp/terraform:latest \
     "${args[@]}"
}

function kubectl {
  local docker_envs=()
  local args=()

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --ENV)
        shift
        docker_envs+=("-e" "$1")
        shift
        ;;
      *)
        args+=("$1")
        shift
        ;;
    esac
  done


  docker run -ti --rm \
     -v $(pwd):/apps \
     -w /apps \
     -v ~/.ssh:/root/.ssh \
     -v /etc/hosts:/etc/hosts \
     --user $UID:$GID \
     "${docker_envs[@]}" \
     alpine/k8s:1.30.12 \
     kubectl \
     --kubeconfig /apps/.kubeconfig \
     "${args[@]}"
}

function helm {
  local docker_envs=()
  local args=()

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --ENV)
        shift
        docker_envs+=("-e" "$1")
        shift
        ;;
      *)
        args+=("$1")
        shift
        ;;
    esac
  done


  docker run -ti --rm \
     -v $(pwd):/apps \
     -w /apps \
     -v ~/.ssh:/root/.ssh \
     -v /etc/hosts:/etc/hosts \
     --user $UID:$GID \
     -e HELM_CONFIG_HOME=./.helm_config \
     -e HELM_CACHE_HOME=./.helm_cache \
     -e HELM_DATA_HOME=./.helm_data \
     "${docker_envs[@]}" \
     alpine/k8s:1.30.12 \
     helm \
     --kubeconfig /apps/.kubeconfig \
     "${args[@]}"
}
