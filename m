From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 00/10] mtd: remove dead map drivers
Date: Tue, 12 Mar 2013 13:00:27 +0200
Message-ID: <1363086037-1420-1-git-send-email-dedekind1@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-pcmcia@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

This patch-set removes a bunch of dean MTD map drivers. The way I judged
whether a driver is dead or not was looking at driver's dependencies in the
Kconfig file. Whenever I saw a driver depending on a Kconfig symbol which is
not defined anywhere, I treated the driver as dead.

The motivation for this patch-set is to clean up the MTD subsystem a little and
lessen the maintenance burden. Indeed, the less drivers we have, the easier it
is to do MTD framework refactoring.

Thanks,
Artem.
