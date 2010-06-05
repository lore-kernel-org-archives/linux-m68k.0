From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH] zorro: BKL removal
Date: Sat, 5 Jun 2010 22:39:55 +0200
Message-ID: <20100605203954.GD5368@nowhere>
References: <alpine.DEB.2.00.1006052121550.12934@ayla.of.borg> <20100605194149.GC5368@nowhere> <AANLkTimy9yNjrOF8QDzQvzo9vzzJuXzs166UYI5wCvFe@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:34903 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932163Ab0FEUj7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 5 Jun 2010 16:39:59 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimy9yNjrOF8QDzQvzo9vzzJuXzs166UYI5wCvFe@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Sat, Jun 05, 2010 at 10:03:33PM +0200, Geert Uytterhoeven wrote:
> On Sat, Jun 5, 2010 at 21:41, Frederic Weisbecker <fweisbec@gmail.com> wrote:
> > On Sat, Jun 05, 2010 at 09:23:01PM +0200, Geert Uytterhoeven wrote:
> >> Remove BKL use from proc_bus_zorro_lseek(), like was done for
> >> proc_bus_pci_lseek() a long time ago.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >> ---
> > Cool.
> >
> > I suspect you'll queue it in your tree? Or should I?
> 
> I'll queue it for 2.6.36.
> 
> But I don't mind you to take it if you want to do something earlier...


It's ok you can take it. I prefer that maintainers take these
bkl works when possible, as they better know the code.
