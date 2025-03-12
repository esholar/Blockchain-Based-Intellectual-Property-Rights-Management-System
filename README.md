# Blockchain-Based Intellectual Property Rights Management

A decentralized system for managing intellectual property rights using Clarity smart contracts on the Stacks blockchain.

## Overview

This project implements a comprehensive IP rights management system with four main components:

1. **Copyright Registration**: Securely register ownership of creative works
2. **Licensing Terms**: Define usage rights and royalty structures
3. **Usage Tracking**: Monitor utilization of copyrighted material
4. **Royalty Distribution**: Automate payments to rights holders

## Smart Contracts

### Copyright Registration Contract

The Copyright Registration contract allows creators to:
- Register new creative works with title, description, and content hash
- Transfer ownership of works to other users
- Update metadata for existing works

### Licensing Terms Contract

The Licensing Terms contract enables:
- Creating licenses with specific terms, royalty rates, and durations
- Revoking licenses when necessary
- Renewing licenses to extend their validity
- Checking if a license is currently active

### Usage Tracking Contract

The Usage Tracking contract provides:
- Recording usage of licensed works (streaming, downloads, etc.)
- Verification of usage records by content owners
- Calculating total usage statistics for works

### Royalty Distribution Contract

The Royalty Distribution contract handles:
- Processing royalty payments based on verified usage
- Distributing royalty tokens to rights holders
- Allowing withdrawal of accumulated royalties

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) for local Clarity development
- [Stacks Wallet](https://www.hiro.so/wallet) for interacting with the contracts on testnet/mainnet

### Installation

1. Clone this repository
```bash
git clone https://github.com/yourusername/blockchain-ip-rights.git
cd blockchain-ip-rights
