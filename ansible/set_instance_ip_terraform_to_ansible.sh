#!/bin/bash
cat ~/CNE-SFIA-2/terraform/terraform.tfstate | grep '"public_ip":' | tr -d '"public_ip" :,'