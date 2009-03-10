From: Geoff Levand <geoffrey.levand@am.sony.com>
Subject: Re: [PATCH 7/7] powerpc/ps3: Add rtc-ps3
Date: Tue, 10 Mar 2009 09:18:52 -0700
Message-ID: <49B692EC.1020505@am.sony.com>
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
> 
> Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
> Cc: Geoff Levand <geoffrey.levand@am.sony.com>
> ---
>  arch/powerpc/include/asm/ps3.h        |    3 +
>  arch/powerpc/platforms/ps3/os-area.c  |    2 +
>  arch/powerpc/platforms/ps3/platform.h |    2 -
>  arch/powerpc/platforms/ps3/setup.c    |    2 -
>  arch/powerpc/platforms/ps3/time.c     |   26 ++++-----
>  drivers/rtc/Kconfig                   |    9 +++
>  drivers/rtc/Makefile                  |    1 +
>  drivers/rtc/rtc-ps3.c                 |  105 +++++++++++++++++++++++++++++++++
>  8 files changed, 132 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/rtc/rtc-ps3.c

Acked-by: Geoff Levand <geoffrey.levand@am.sony.com>

