From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v3 00/30] Refine PCI scan interfaces and make generic pci
 host bridge
Date: Wed, 25 Feb 2015 23:51:23 -0600
Message-ID: <20150226055123.GA5415__7226.64826685122$1424929959$gmane$org@google.com>
References: <1424914187-21027-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424914187-21027-1-git-send-email-wangyijing@huawei.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yijing Wang <wangyijing@huawei.com>
Cc: Jiang Liu <jiang.liu@linux.intel.com>, linux-pci@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rusty Russell <rusty@rustcorp.com.au>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Liviu Dudau <liviu@dudau.co.uk>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>

On Thu, Feb 26, 2015 at 09:29:17AM +0800, Yijing Wang wrote:
> v2->v3:
> 	Rebase this series on v4.0-rc1.

Hm, still doesn't apply for me:

  11:48:15 ~/linux (pci/enumeration)$ git show --oneline | head -1
  c517d838eb7d Linux 4.0-rc1
  11:48:36 ~/linux (pci/enumeration)$ stg import -M --sign m/yw
  Checking for changes in the working directory ... done
  Importing patch "pci-rip-out" ... done
  Importing patch "pci-rip-out-0" ... done
  Importing patch "xen-pci-don-t-use-deprecated" ... done
  Importing patch "pci-remove-deprecated" ... done
  Importing patch "pci-rename-pci_scan_bus-to" ... done
  Importing patch "pci-combine-pci-domain-and-bus" ... done
  Importing patch "pci-pass-pci-domain-number" ... done
  Importing patch "pci-introduce" ... done
  Importing patch "pci-separate-pci_host_bridge" ... done
  Importing patch "pci-introduce-0" ... done
  Importing patch "pci-save-sysdata-in" ... error: patch failed: drivers/pci/host-bridge.c:58
  error: drivers/pci/host-bridge.c: patch does not apply
  error: patch failed: drivers/pci/probe.c:1954
  error: drivers/pci/probe.c: patch does not apply
  stg import: Diff does not apply cleanly
  11:48:52 ~/linux (pci/enumeration)$ 
