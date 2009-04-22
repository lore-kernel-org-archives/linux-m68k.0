From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Atari GEMDOS FAT option fix: use correct logical
	sector size
Date: Wed, 22 Apr 2009 21:11:43 +0200
Message-ID: <10f740e80904221211h67c4e3d5ob50d82f253f1b5fb@mail.gmail.com>
References: <20090326123822.GD8081@marenka.net> <1239698381.2049.25.camel@petr>
	 <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
	 <1239774966.20245.4.camel@petr>
	 <alpine.DEB.1.00.0904160107540.4339@zirkon.biophys.uni-duesseldorf.de>
	 <1239862075.12777.14.camel@petr>
	 <alpine.DEB.1.00.0904160934480.19859@zirkon.biophys.uni-duesseldorf.de>
	 <1239868903.12777.25.camel@petr>
	 <alpine.DEB.1.00.0904170314220.18855@zirkon.biophys.uni-duesseldorf.de>
	 <alpine.DEB.1.00.0904190308310.8939@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <alpine.DEB.1.00.0904190308310.8939@zirkon.biophys.uni-duesseldorf.de>
Resent-Message-ID: <eeNE_7vKBTM.A.GqB.Lw27JB@liszt>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Petr Stehlik <pstehlik@sophics.cz>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Sun, Apr 19, 2009 at 03:20, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
> Fix erroneous use of device blocksize instead of logical sector size in
> Atari GEMDOS FAT code (GEMDOS uses a 16 bit FAT and a constant 2 logical
> sectors per cluster, and modifies the logical sector size to cope with the
> limits imposed by the 16 bit FAT). The bug was probably introduced by me when
> porting this code forward from 2.4.
> With this fix, I can successfully mount GEMDOS partitons up to 256 MB in size as
> prepared by Petr Stehlik. 512 MB require 8k sector size, sorry.

Thanks, added.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
