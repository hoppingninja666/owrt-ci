# OpenWRT-CI
Cloud-based OpenWRT firmware compilation

Official version:
https://github.com/immortalwrt/immortalwrt.git

Qualcomm version:
https://github.com/VIKINGYFY/immortalwrt.git

# Firmware Overview:

Firmware is automatically compiled daily at 4:00 AM.

The timestamp in the firmware information indicates the compilation start time, making it easy to verify upstream source code commit times.

Supports MEDIATEK series, QUALCOMM series, ROCKCHIP series, and X86 series.

# Directory Structure:

workflows - Custom CI configurations

Scripts - Custom scripts

Config - Custom configurations

# Local Development

## Running with act

To run GitHub Actions locally using the `act` utility, use the provided helper script:

```bash
# Run with dryrun (recommended for testing)
./act-runner.sh

# Run a specific workflow
./act-runner.sh .github/workflows/WRT-TEST.yml

# Run without dryrun (actual execution)
act -W .github/workflows/WRT-CORE.yml -P ubuntu-latest=catthehacker/ubuntu:act-latest

# For workflows with matrix jobs (QCA-ALL, OWRT-ALL, WRT-TEST), specify the job:
act -W .github/workflows/QCA-ALL.yml -j config -P ubuntu-latest=catthehacker/ubuntu:act-latest
```

**Note**: The workflows use a custom Ubuntu image (`catthehacker/ubuntu:act-latest`) to avoid AppArmor compatibility issues with the `act` utility.
