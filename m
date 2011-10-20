From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 12/21 v2] m68k: drop unused Kconfig symbols
Date: Thu, 20 Oct 2011 12:58:13 +0200
Message-ID: <1319108293.8405.21.camel__15253.5980254926$1319108795$gmane$org@x61.thuisdomein>
References: <1318925407.6414.22.camel@x61.thuisdomein>
	 <4E9D6C05.9040106@snapgear.com> <1318941043.6414.35.camel@x61.thuisdomein>
	 <4E9FB0D6.9080301@snapgear.com>
	 <CAMuHMdVpAhJDhTDSwRWb7s4KvMGzh+twL7DhH1Ww=ZNK9aNE2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVpAhJDhTDSwRWb7s4KvMGzh+twL7DhH1Ww=ZNK9aNE2w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@snapgear.com>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Thu, 2011-10-20 at 08:54 +0200, Geert Uytterhoeven wrote:
> BTW, a few of the *_SCC symbols became orphaned, too.

Yes, MVME147_SCC, MVME162_SCC and BVME6000_SCC look unused. I missed
those because of these lines:
config SERIAL_CONSOLE
        bool "Support for serial port console"
        depends on [..] MVME147_SCC || [...] MVME162_SCC || BVME6000_SCC [...]

The scripts I used aren't smart enough to evaluate a second instance of
these symbols. One of the simple heuristics they used was: "mentioned a
second time in any of the Kconfig files means it is used".

I haven't yet discovered a smarter way to do this. In this case that
might be: if any other usage of the symbol in the Kconfig doesn't
"select" any other symbol it is unused (provided, of course, there's no
instance of CONFIG_$symbol in any non-Kconfig file) . But I don't know
if that will work. Moreover, this requires an actual parser of the
Kconfig syntax. I've chosen to keep things as dumb as possible, and use
as little understanding of the Kconfig syntax as possible. I still found
quite a number of unused symbols with an acceptable signal to noise
ratio. False-negatives like these are the downside.


Paul Bolle
