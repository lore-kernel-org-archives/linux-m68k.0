Received: from welho-filter1.welho.com (welho-filter1b.welho.com [83.102.41.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08774EEC5
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Sep 2024 21:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.41.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727042266; cv=none; b=IqFvDJaGTvrJkxYyDfbLw2Xxy8AXCncTGAELm5YThHICfL82brW+A0PnVvvTz1IbdiQsp0taFGZ8Zh0YEfBLL5+h3lV0X1CY0NZ3ICQbI6lYvit0ipXVLA8Y0EkSg4Od2m8LyAq0zqliK0lFE/cQfySCT4iUBIOKGvyXFpbFzNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727042266; c=relaxed/simple;
	bh=Zg3xvZI3DLDDt4RVts+Da3nOrc5S1YVlh/edm5b3SvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bfUOVSRtdatyHo9Fcv9rVwiSvAb4e5Z3bXvN2FiumNNye+ffRZRLUyz/0ixWII7HZQ4sGhYaorAKZg8DkI2zvwf81dtPkmS9UoGwYGk8g/yXBCDoxMoXcl0EEV2eQLcypbpbu4XDU9Sj3Gst7kNF/mT9s6eXqqmejv3vcpvQHTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; arc=none smtp.client-ip=83.102.41.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Received: from localhost (localhost [127.0.0.1])
	by welho-filter1.welho.com (Postfix) with ESMTP id 9305C1C3FA;
	Mon, 23 Sep 2024 00:49:40 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp3.welho.com ([IPv6:::ffff:83.102.41.86])
	by localhost (welho-filter1.welho.com [::ffff:83.102.41.23]) (amavisd-new, port 10024)
	with ESMTP id wIfwyfIxvaah; Mon, 23 Sep 2024 00:49:40 +0300 (EEST)
Received: from localhost.localdomain (87-92-110-153.bb.dnainternet.fi [87.92.110.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by welho-smtp3.welho.com (Postfix) with ESMTPSA id 225082309;
	Mon, 23 Sep 2024 00:49:35 +0300 (EEST)
From: Eero Tamminen <oak@helsinkinet.fi>
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Eero Tamminen <oak@helsinkinet.fi>
Subject: [PATCH 2/2] m68k: Set reasonable PSG port-A default value
Date: Mon, 23 Sep 2024 00:48:21 +0300
Message-Id: <20240922214821.16818-2-oak@helsinkinet.fi>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240922214821.16818-1-oak@helsinkinet.fi>
References: <20240922214821.16818-1-oak@helsinkinet.fi>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes continuous IDE & DSP reset requests on Atari Falcon from 2Hz
floppy media change detection if those bits happen to be set (to
a different value than ROM defaults) before Linux starts.

All successive port-A requests preserve unrelated bits.  If bits 4 & 6
are set, that means every PSG port-A request, such as floppy media
change detection, being also Falcon DSP & IDE reset request.

Signed-off-by: Eero Tamminen <oak@helsinkinet.fi>
---
 Documentation/arch/m68k/kernel-options.rst |  4 +++-
 arch/m68k/atari/config.c                   | 10 ++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/m68k/kernel-options.rst b/Documentation/arch/m68k/kernel-options.rst
index 2008a20b4..cae270018 100644
--- a/Documentation/arch/m68k/kernel-options.rst
+++ b/Documentation/arch/m68k/kernel-options.rst
@@ -674,8 +674,10 @@ items:
 	set RTS of the MIDI ACIA high
   snd6:
 	set bit 6 of the PSG port A
+	(Falcon: internal speaker on/off, others: monitor jack GPO pin)
   snd7:
-	set bit 6 of the PSG port A
+	set bit 7 of the PSG port A
+	(Falcon: IDE drive on/off, TT: SCC-A LAN/serial2)
 
 It doesn't make sense to mention a switch more than once (no
 difference to only once), but you can give as many switches as you
diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index b48a0606a..0e4bd90fe 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -188,6 +188,7 @@ early_param("switches", atari_switches_setup);
 void __init config_atari(void)
 {
 	unsigned short tos_version;
+	unsigned char porta_init = 0x07;
 
 	memset(&atari_hw_present, 0, sizeof(atari_hw_present));
 
@@ -212,11 +213,12 @@ void __init config_atari(void)
 	if (atari_switches & ATARI_SWITCH_MIDI)
 		acia.mid_ctrl = ACIA_DIV16 | ACIA_D8N1S | ACIA_RHTID;
 	if (atari_switches & (ATARI_SWITCH_SND6|ATARI_SWITCH_SND7)) {
-		sound_ym.rd_data_reg_sel = 14;
-		sound_ym.wd_data = sound_ym.rd_data_reg_sel |
-				   ((atari_switches&ATARI_SWITCH_SND6) ? 0x40 : 0) |
-				   ((atari_switches&ATARI_SWITCH_SND7) ? 0x80 : 0);
+		porta_init |= ((atari_switches&ATARI_SWITCH_SND6) ? 0x40 : 0) |
+			      ((atari_switches&ATARI_SWITCH_SND7) ? 0x80 : 0);
 	}
+	/* Set PSG port-A defaults */
+	sound_ym.rd_data_reg_sel = 14;
+	sound_ym.wd_data = porta_init;
 
 	/* ++bjoern:
 	 * Determine hardware present
-- 
2.39.5

