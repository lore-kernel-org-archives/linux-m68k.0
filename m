From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] m68k: Remove references to obsolete CONFIG_SERIAL167
Date: Thu, 17 Nov 2011 22:40:55 +0100
Message-ID: <1321566055.20271.313.camel@x61.thuisdomein>
References: <1321180296-22543-1-git-send-email-geert@linux-m68k.org>
	 <1321182176.20271.43.camel@x61.thuisdomein>
	 <CAMuHMdXsHgUd_oggpKoS2t6Tm8MnEjLnWmi4Hswz_nQjSWsozA@mail.gmail.com>
	 <1321559636.20271.287.camel@x61.thuisdomein>
	 <CAMuHMdW73Nf+bP2u6NRZFMW5c0-PnqYCDtEbZ+weGLs_mzZ1_g@mail.gmail.com>
	 <1321565687.20271.309.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1321565687.20271.309.camel@x61.thuisdomein>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, Jiri Kosina <trivial@kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Thu, 2011-11-17 at 22:34 +0100, Paul Bolle wrote:
> I see nothing universal about it: two independent usages, one in
> */iss/console.c and one in */amiserial.c. So I'd say these can be
> renamed to (say) ISS_SERIAL_CONSOLE and AMIGA_BUILTIN_SERIAL_CONSOLE.

And, looking at it again, in */iss/console.c it can just as well be
dropped, as SERIAL_CONSOLE will always be set for that platform. So the
only actual usage I see is in */amiserial.c.


Paul Bolle
