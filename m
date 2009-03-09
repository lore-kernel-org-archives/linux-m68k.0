From: Geoff Levand <geoffrey.levand@am.sony.com>
Subject: Re: [PATCH 7/7] powerpc/ps3: Add rtc-ps3
Date: Mon, 9 Mar 2009 11:35:58 -0700
Message-ID: <49B5618E.9050501@am.sony.com>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-2-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-3-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-4-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-5-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-6-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-7-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-8-git-send-email-Geert.Uytterhoeven@sonycom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1236605183-22718-8-git-send-email-Geert.Uytterhoeven@sonycom.com>
Sender: linux-parisc-owner@vger.kernel.org
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Alessandro Zummo <alessandro.zummo@towertech.it>, Kyle McMartin <kyle@mcmartin.ca>, rtc-linux@googlegroups.com, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>
List-Id: linux-m68k@vger.kernel.org

On 03/09/2009 06:26 AM, Geert Uytterhoeven wrote:
> Create a real RTC driver for PS3, and unhook the deprecated
> ppc_md.[gs]et_rtc_time.

>  8 files changed, 132 insertions(+), 18 deletions(-)

Sorry, I hadn't been following the discussion closely, but
could you explain why we are going from a generic framework
where we hook in our platform specific part to a totally
independent driver that has such an increase in code size.

Why couldn't you fix the generic part so that udev could
load it automatically?

I much prefer to have this code in the platform support
code as it was.  It is much more effort (a pain) to maintain
a separate driver were I have to cater to a subsystem's
maintainer, and with this rtc it seems everyone who was
using the generic PPC driver will need to do the same.

-Geoff

