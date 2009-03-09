From: Alessandro Zummo <alessandro.zummo@towertech.it>
Subject: Re: [rtc-linux] [PATCH 7/7] powerpc/ps3: Add rtc-ps3
Date: Mon, 9 Mar 2009 15:12:16 +0100
Message-ID: <20090309151216.17f13862@i1501.lan.towertech.it>
References: <1236605183-22718-1-git-send-email-Geert.Uytterhoeven@sonycom.com>
	<1236605183-22718-2-git-send-email-Geert.Uytterhoeven@sonycom.com>
	<1236605183-22718-3-git-send-email-Geert.Uytterhoeven@sonycom.com>
	<1236605183-22718-4-git-send-email-Geert.Uytterhoeven@sonycom.com>
	<1236605183-22718-5-git-send-email-Geert.Uytterhoeven@sonycom.com>
	<1236605183-22718-6-git-send-email-Geert.Uytterhoeven@sonycom.com>
	<1236605183-22718-7-git-send-email-Geert.Uytterhoeven@sonycom.com>
	<1236605183-22718-8-git-send-email-Geert.Uytterhoeven@sonycom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1236605183-22718-8-git-send-email-Geert.Uytterhoeven@sonycom.com>
Sender: linux-parisc-owner@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: Geert.Uytterhoeven@sonycom.com, Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>, Dann Frazier <dannf@dannf.org>, Geoff Levand <geoffrey.levand@am.sony.com>
List-Id: linux-m68k@vger.kernel.org

On Mon,  9 Mar 2009 14:26:23 +0100
Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com> wrote:

 Hi,

   just a few notes:

> +
> +static int ps3_get_time(struct device *dev, struct rtc_time *tm)
> +{
> +	to_tm(read_rtc() + ps3_os_area_get_rtc_diff(), tm);
> +	tm->tm_year -= 1900;
> +	tm->tm_mon -= 1;
> +	return 0;
> +}

 this should be return rtc_valid_tm() .

 can't you use functions from rtc-lib.c instead of 
 that to_tm ?

> +
> +MODULE_AUTHOR("Sony Corporation");

 real name, if possible and a contact address
 here . Just in case I need someone to bother :)

-- 

 Best regards,

 Alessandro Zummo,
  Tower Technologies - Torino, Italy

  http://www.towertech.it

