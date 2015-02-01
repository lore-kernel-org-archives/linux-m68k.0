From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: nvram and generic_nvram modules are problematic, was Re: [PATCH]
 arch: m68k: mac: misc.c: Remove some unused functions
Date: Sun, 1 Feb 2015 08:42:45 +0000
Message-ID: <20150201084245.GF26493@n2100.arm.linux.org.uk>
References: <1420131732-31039-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
 <alpine.LNX.2.00.1501041045020.15927@nippy.intranet>
 <CAMuHMdXFu3n4d0dMZop186UF+QG=MtLHV=oQr+VszftpEA1kFQ@mail.gmail.com>
 <alpine.LNX.2.00.1502011230150.32582@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1502011230150.32582@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>

On Sun, Feb 01, 2015 at 02:39:42PM +1100, Finn Thain wrote:
> I find the ARM support in drivers/char/nvram to be surprising, not to say 
> questionable. The /proc/driver/nvram implementation, given 
> defined(__arm__), decodes the NVRAM contents in exactly the same format as 
> when defined(__i386__) || defined(__x86_64__).

That's because it's used on the Netwinder and EBSA285 platforms, which
are PCI-like, complete with a southbridge which makes them look like a
PC.

> Whereas, only MIPS and 
> PowerPC defconfigs set CONFIG_RTC_DRV_CMOS at all, and without that symbol 
> the driver will never be built for ARM. This raises the question, does 
> /proc/driver/nvram do anything useful on any ARM platforms?

Yes.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
