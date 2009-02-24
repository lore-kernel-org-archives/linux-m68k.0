From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH/RFC 0/5] Generic RTC class driver
Date: Tue, 24 Feb 2009 19:46:07 +0100
Message-ID: <49A4406F.2010407__32680.9785482057$1235501279$gmane$org@gmx.de>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Kyle McMartin <kyle@mcmartin.ca>, David Woodhouse <dwmw2@infradead.org>, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, dann frazier <dannf@dannf.org>

Geert Uytterhoeven wrote:
> I've been looking into problems with auto-loading the RTC driver on PPC (more
> specifically on PS3):
>   - The recent "rtc-ppc" RTC class driver is not autoloaded by udev because
>     it's an old style platform driver that contains its own platform device.
>   - The alternative old "genrtc" driver is autoloaded on non-udev systems only
>     because it contains the module alias char-major-10-135. However, it's not
>     a new-style RTC class driver.
> 
> Fortunately there already exists a generic RTC class driver: "rtc-parisc".
> Despite it's name, it's platform-independent, as it's build on top of the RTC
> abstraction used by "genrtc".
> 
> This patch series
>   - adds a missing module alias to rtc-parisc,
>   - renames rtc-parisc to rtc-generic,
>   - converts the architectures that currently have CONFIG_GEN_RTC enabled in
>     their defconfig (m68k, parisc, powerpc) to rtc-generic,
>   - removes the obsolete rtc-ppc driver,
>   - removes the old genrtc driver.
>   
> Note that genrtc may be used on other archictectures as well: at least alpha
> has the required infrastructure ([gs]et_rtc_time()). The Kconfig rules allow
> genrtc to be enabled on several others (cris, h8300, mn10300, um, x86, xtensa).
> 
> Furthermore genrtc and rtc-generic are not 100% userspace compatible:
>   - /dev/rtc provided by genrtc uses a misc character device (10:135),
>   - /dev/rtc provided by rtc-generic uses a dynamic character device.
>   
> So perhaps we don't want to kill gen-rtc yet?
> 
> Any comments are welcomed!

Hi Geert,
FYI, I didn't followed any discussions or changes around the RTC drivers for parisc,
but Dann Frazier did some work on the parisc RTC driver as well.
His patches were merged (not upstream yet!) in Kyle's "rtc-parisc" branch at:
http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=shortlog;h=rtc-parisc

Not sure if they conflict (or are in sync) with your patches...

Helge
