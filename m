From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k v3.16 status update
Date: Wed, 6 Aug 2014 09:35:37 +0200
Message-ID: <CAMuHMdX-46QGM6T3G_e0RzeTm8vDZ1Ofa2R2w3BQmf_nJxPQLA@mail.gmail.com>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>
	<06A072CC-7C42-47C2-A877-9012C3DE6585@2014.bluespice.org>
	<20140805202904.GA23676@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20140805202904.GA23676@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2014.bluespice.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>, karcher@physik.fu-berlin.de

On Tue, Aug 5, 2014 at 10:29 PM, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, Aug 05, 2014 at 09:52:58PM +0200, Ingo J=C3=BCrgensmann wrote=
:
>> Am 05.08.2014 um 21:40 schrieb Geert Uytterhoeven <geert@linux-m68k.=
org>:
>>
>> > m68k v3.16 is out!
>> > git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
>> > m68k-queue is getting smaller, but there are still a few commits l=
eft:
>>
>> Hmm, what about the Blizzard 2060 SCSI driver from Michael & Tuomas?=
 It runs since then on Akire...
>
> Add to that the X-Surf100 driver that Michael Karcher wrote [1] but
> unfortunately he hasn't cleaned up the code yet and submitted it for
> inclusion in the mainline kernel.

"May I remind you that patches touching areas outside arch/m68k must be
submitted to the appropriate maintainer (use scripts/get_maintainer.pl)=
=2E"

The current policy is to not add drivers to the m68k repository if they=
 should
go in through other maintainers.

The Atari ROM Port ISA-based EtherNEC, EtherNAT, and NetUSBee drivers
are there because the Atari ROM Port ISA support originated in the old
Linux/m68k CVS repository.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
