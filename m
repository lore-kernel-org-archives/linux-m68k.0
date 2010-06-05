From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] zorro: BKL removal
Date: Sat, 5 Jun 2010 22:03:33 +0200
Message-ID: <AANLkTimy9yNjrOF8QDzQvzo9vzzJuXzs166UYI5wCvFe@mail.gmail.com>
References: <alpine.DEB.2.00.1006052121550.12934@ayla.of.borg>
	<20100605194149.GC5368@nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:50753 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932163Ab0FEUDe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 5 Jun 2010 16:03:34 -0400
In-Reply-To: <20100605194149.GC5368@nowhere>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Sat, Jun 5, 2010 at 21:41, Frederic Weisbecker <fweisbec@gmail.com> wrote:
> On Sat, Jun 05, 2010 at 09:23:01PM +0200, Geert Uytterhoeven wrote:
>> Remove BKL use from proc_bus_zorro_lseek(), like was done for
>> proc_bus_pci_lseek() a long time ago.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
> Cool.
>
> I suspect you'll queue it in your tree? Or should I?

I'll queue it for 2.6.36.

But I don't mind you to take it if you want to do something earlier...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
