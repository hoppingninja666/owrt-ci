#!/bin/bash

# Helper script to run GitHub Actions locally with act
# This script uses a custom Ubuntu image that's compatible with act and avoids AppArmor issues

# Default workflow if none specified
WORKFLOW=${1:-".github/workflows/WRT-CORE.yml"}

# Platform specification to avoid AppArmor issues
PLATFORM="-P ubuntu-latest=catthehacker/ubuntu:act-latest"

# Set environment variable to indicate we're running with act
export ACT=true

echo "Running workflow: $WORKFLOW"
echo "Using platform: $PLATFORM"
echo ""

# Determine the event type and job specification based on the workflow
if [[ "$WORKFLOW" == *"QCA-ALL.yml" ]] || [[ "$WORKFLOW" == *"OWRT-ALL.yml" ]] || [[ "$WORKFLOW" == *"WRT-TEST.yml" ]]; then
    # These workflows use workflow_dispatch event and need job specification
    EVENT="workflow_dispatch"
    echo "Using event: $EVENT"
    echo "Using job: config"
    act --dryrun -W "$WORKFLOW" -j config -e <(echo '{"workflow_dispatch": {}}') $PLATFORM
else
    # Default event for other workflows
    act --dryrun -W "$WORKFLOW" $PLATFORM
fi

echo ""
echo "To run without dryrun, remove the --dryrun flag"
echo "Example: act -W $WORKFLOW $PLATFORM" 