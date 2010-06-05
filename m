From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] zorro: BKL removal
Date: Sat, 5 Jun 2010 21:53:42 +0200
Message-ID: <201006052153.43062.arnd__19404.3922624134$1275767670$gmane$org@arndb.de>
References: <alpine.DEB.2.00.1006052121550.12934@ayla.of.borg>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1006052121550.12934@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Saturday 05 June 2010, Geert Uytterhoeven wrote:
> Remove BKL use from proc_bus_zorro_lseek(), like was done for
> proc_bus_pci_lseek() a long time ago.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
