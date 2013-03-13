From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 00/10] mtd: remove dead map drivers
Date: Wed, 13 Mar 2013 13:05:41 +0200
Message-ID: <1363172741.11441.19.camel@sauron.fi.intel.com>
References: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: MTD Maling List <linux-mtd@lists.infradead.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-pcmcia@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>

On Tue, 2013-03-12 at 13:14 +0200, Artem Bityutskiy wrote:
> This patch-set removes a bunch of dean MTD map drivers. The way I judged
> whether a driver is dead or not was looking at driver's dependencies in the
> Kconfig file. Whenever I saw a driver depending on a Kconfig symbol which is
> not defined anywhere, I treated the driver as dead.
> 
> The motivation for this patch-set is to clean up the MTD subsystem a little and
> lessen the maintenance burden. Indeed, the less drivers we have, the easier it
> is to do MTD framework refactoring.

Pushed to l2-mtd.git, if there are objections, I can remove the
patch(es) in question.

-- 
Best Regards,
Artem Bityutskiy
