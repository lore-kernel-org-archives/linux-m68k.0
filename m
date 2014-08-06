From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: m68k v3.16 status update
Date: Wed, 06 Aug 2014 11:53:06 +0200
Message-ID: <53E1FB02.8090000@physik.fu-berlin.de>
References: <CAMuHMdXodxq=Z8rQAZ7UUdzUzoPfQLFCSTkJziVeAsq8MMQxmQ@mail.gmail.com>	<06A072CC-7C42-47C2-A877-9012C3DE6585@2014.bluespice.org>	<20140805202904.GA23676@physik.fu-berlin.de> <CAMuHMdX-46QGM6T3G_e0RzeTm8vDZ1Ofa2R2w3BQmf_nJxPQLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX-46QGM6T3G_e0RzeTm8vDZ1Ofa2R2w3BQmf_nJxPQLA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?B?SW5nbyBKw7xyZ2Vuc21hbm4=?= <ij@2014.bluespice.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>, karcher@physik.fu-berlin.de

On 08/06/2014 09:35 AM, Geert Uytterhoeven wrote:
>> Add to that the X-Surf100 driver that Michael Karcher wrote [1] but
>> unfortunately he hasn't cleaned up the code yet and submitted it for
>> inclusion in the mainline kernel.
> 
> "May I remind you that patches touching areas outside arch/m68k must be
> submitted to the appropriate maintainer (use scripts/get_maintainer.pl)."
> 
> The current policy is to not add drivers to the m68k repository if they should
> go in through other maintainers.

I know, I was not implying that, sorry :). I am just still waiting for
the xsurf100 driver to be included in the mainline kernel.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
