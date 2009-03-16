From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/7] parisc: rtc: Rename rtc-parisc to rtc-generic
Date: Mon, 16 Mar 2009 14:09:16 +0100
Message-ID: <20090316130916.GA3324@lst.de>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-2-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-3-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-4-git-send-email-Geert.Uytterhoeven@sonycom.com> <1236605183-22718-5-git-send-email-Geert.Uytterhoeven@sonycom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-parisc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1236605183-22718-5-git-send-email-Geert.Uytterhoeven@sonycom.com>
Sender: linux-parisc-owner@vger.kernel.org
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Alessandro Zummo <alessandro.zummo@towertech.it>, Kyle McMartin <kyle@mcmartin.ca>, linux-m68k@vger.kernel.org, rtc-linux@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, Mar 09, 2009 at 02:26:20PM +0100, Geert Uytterhoeven wrote:
> The rtc-parisc driver is not PA-RISC specific at all, as it uses the existing
> (but deprecated) generic RTC infrastructure ([gs]et_rtc_time()).
> Rename the driver from rtc-parisc to rtc-generic.

Maybe it should be called rtc-legacy instead?

