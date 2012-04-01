From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH 5/5] m68k/atari: EtherNAT - enable USB HCD config option on
 Atari
Date: Sun, 01 Apr 2012 15:10:30 +1200
Message-ID: <4F77C726.9020106@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org> <4F4B2BB6.900@gmail.com> <alpine.DEB.2.00.1203071053360.3196@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:57184 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754196Ab2DADKh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Mar 2012 23:10:37 -0400
Received: by dake40 with SMTP id e40so1056980dak.11
        for <linux-m68k@vger.kernel.org>; Sat, 31 Mar 2012 20:10:36 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1203071053360.3196@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hi All,

Part 5 in the EtherNAT series: actually enable the necessary USB HCD 
support option to be able to chose the ISP116x USB driver on Atari.

Signed-off-by: Michael Schmitz <schmitz@debian.org>

--
 arch/m68k/Kconfig.machine |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 7cdf6b0..8c31cdf 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -15,6 +15,7 @@ config ATARI
        bool "Atari support"
        depends on MMU
        select MMU_MOTOROLA if MMU
+       select USB_ARCH_HAS_OHCI if USB_SUPPORT
        help
          This option enables support for the 68000-based Atari series of
          computers (including the TT, Falcon and Medusa). If you plan 
to use
