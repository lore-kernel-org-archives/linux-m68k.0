From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] pci: Add and use PCI_GENERIC_SETUP Kconfig entry
Date: Sat, 24 Jun 2017 08:08:43 -0700
Message-ID: <60bd9a54-0220-5d52-8843-ea3a654020a6@twiddle.net>
References: <20170623220104.GE31455@jhogan-linux.le.imgtec.org>
 <20170623220857.28774-1-palmer@dabbelt.com>
 <20170623220857.28774-2-palmer@dabbelt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34978 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754814AbdFXPIr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 24 Jun 2017 11:08:47 -0400
In-Reply-To: <20170623220857.28774-2-palmer@dabbelt.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Palmer Dabbelt <palmer@dabbelt.com>, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, geert@linux-m68k.org, ralf@linux-mips.org, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, cmetcalf@mellanox.com, gxt@mprc.pku.edu.cn, bhelgaas@google.com, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-m68k@vger.kernel.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, hch@infradead.org

On 06/23/2017 03:08 PM, Palmer Dabbelt wrote:
> We wanted to add RISC-V to the list of architectures that used the
> generic PCI setup-irq.o inside the Makefile and it was suggested that
> instead we define a Kconfig entry and use that.
> 
> I've done very minimal testing on this: I just checked to see that
> an aarch64 defconfig still build setup-irq.o with the patch applied.
> The intention is that this patch doesn't change the behavior of any
> build.
> 
> Signed-off-by: Palmer Dabbelt<palmer@dabbelt.com>
> Reviewed-by: James Hogan<james.hogan@imgtec.com>
> ---
>   arch/alpha/Kconfig     |  1 +

Acked-by: Richard Henderson <rth@twiddle.net>


r~
