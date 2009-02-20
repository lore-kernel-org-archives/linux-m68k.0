From: Alessandro Zummo <alessandro.zummo@towertech.it>
Subject: Re: [rtc-linux] [PATCH/RFC 0/5] Generic RTC class driver
Date: Fri, 20 Feb 2009 17:04:54 +0100
Message-ID: <20090220170454.04382e9e__36915.3947489851$1235146103$gmane$org@i1501.lan.towertech.it>
References: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx0.towertech.it ([213.215.222.73]:39794 "HELO mx0.towertech.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751754AbZBTQE6 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 20 Feb 2009 11:04:58 -0500
In-Reply-To: <1235144809-32468-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: Geert.Uytterhoeven@sonycom.com, Kyle McMartin <kyle@mcmartin.ca>, David Woodhouse <dwmw2@infradead.org>, Richard Zidlicky <rz@linux-m68k.org>, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Fri, 20 Feb 2009 16:46:44 +0100
Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:

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

 Hello,

   my opinion on this kind of stuff is that I want to avoid the layering
 of implementations under the rtc subsystem. I'd rather prefer that each
 rtc device had its own driver. 
 
  I've made error in the past, by accepting such kind of drivers, and
 would like to avoid that it happens again.

  Regarding the user space, the assumption that a device has
 a fixed major:minor number should be dropped as well.

-- 

 Best regards,

 Alessandro Zummo,
  Tower Technologies - Torino, Italy

  http://www.towertech.it

