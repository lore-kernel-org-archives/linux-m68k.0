Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02253E2754
	for <linux-m68k@lists.linux-m68k.org>; Sat,  5 Sep 2026 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591856; cv=none; b=Cyi6F7q0HKMa8kK2mwbjzOz55Gh8oCaugeT0UYlRrpYziCTW9AcTZJrL04toF3B2TIoftciIWdLs9p7DmG1GsbPXuQO+nYP6ZORd3qsI7LKscbBWGUJlY/GUX8upS7y1YVnq4xbzjLge5EpwZZ7BsnBJC6zMNAq/dE6ddXsO4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591856; c=relaxed/simple;
	bh=iIEWAYVGI2FzX5iZTyH81lDATptMQacAG0wTPy+abXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I2116XCVeIpskUYwnEa/kX0PwBnKCeYqj4Ex0WSy40hI0j8iWlRdWG0Fxv/eivi+BXcvhkhnPoAe3IvnIavtOr8mm2FHlkaQ6sQfeLakuDMh31Tgt8aWdqjYdJh0ve8Ay081NZVbCdnARWzqoYPRiexGdbT74ayhn1NzC8+/dcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2+kYOgi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2+kYOgi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4859245e493so175381f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 05 Sep 2026 00:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591849; x=1789196649; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=F2+kYOgiAMH3iVQwepNyQ5rGvqj8nVHlljuMOCZxYxkZwALi4zKVWq4pGomvYqUwFj
         14moTIPy+ki1ZW/bBUfVxKfU7lflIqEdV201HE2u/NQUKRLRDAPM8aCz/nDXpRQSRNlc
         BjI9hhzwmMmaA1z0rv6aJdZX42jIQtBSlQz4dukddzgmf9XgZjLdL0+UjuUbv81GV8cV
         lplE/IuPSx0XzgRi5cDJk84Eec7UYpJHvUrmwZ6XITzEcfTBd2ezkLfVUF3GDyTYmAOC
         DJJstcXdd93fHatQM8ESXUjYJaEdGmwvGdmRM3fP41D6/BlmUj31ii1XjwA/WhbEcS2p
         3+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591849; x=1789196649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=qjH0xZeZ8UwaAZvn7JT9gIS7pDh2UmL5zxStW+OFLF5cWX6AvikOkANM8qB7szYSGq
         NMqeqv+RUGz+g7snpD8TcNVM07/uwu9ZzECwjCww1BK5g/Q3iBcipc975u5JqonMyLqu
         dnZHyP0z3XhtPpbrWSojhPWulIlUXdgDSO12DOmkqY2S9qYN223o0kvc5hfaRn68keN+
         1ObozK8/EQZZ5q+xWHTiPf+SzMEin80paGqmYDCZA8ToGfP58AZX5O6H062UeMdYy3xl
         AXnDT5kXkL4iJzzfkl0IVoHbzNuZBxmQsrK2VZohc2UwA1ODWsIaq6kOmOBg6sfF3tk0
         BdVQ==
X-Forwarded-Encrypted: i=1; AKwUvByfCADsRNf/Jv8rDJee3aroQl7g3WssZMFneYGAHN+lLtSeRswy85bVhpztcGmU3f2iEaaxxVcw4MMP@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nXpVqY1RSe/LQPP6ZKjw7WdIf5TwzLVDB4H8dWFnizz7C1fINO
	k9cGi/RgAz0Sc9JZuzR2/lFi//jWonSF7DJRJ6QuH92ujlZklccSJXv+
X-Gm-Gg: AYBFou0J6Xd8054UdEnBy3byefxz5PqFtwPz5ZXl5Uxv0sKH3cstC+7BCZ/VyRxBy1J
	8nDU46kKQZDfeTdU75sfKLm4KRWO27kYSpc3MYYY4oKBr/i0EIedhddS5y+zBxXwAfB5hUpS0GD
	DPNYm6tgmGQt4Gf2MIiGCTo0eG3V8PpBllGcHtbDSdy0mce0xfJPpcfmSsJ3+Lro/0GjRMX5KoM
	KShm8pqPd3baNOSTNmPqbMw+1FE7D3PU3tb838+2AjRWYkSanBVFjQ3PVGtigCVPOs0n8eD/3Cz
	Sjnnpem3gYIHeai+Q3yUuU/AV1HiAOalhA7BBS324KPo1GiNdgwoK7Xj1rA9hrYu+MeP6mr0HXg
	YRZalbkT9BVMm3JPy4y4PrQ0D5QhW/E7dgDFkC5XJGjqLi/WjyBj80CREbbJz/Upn33ZWEw71SM
	sZUpAa4ibXNWSjWPjDS4nLtH54DcsevQ5Or4Ai3pmsclsx76eoXsMRpjMGJ9NPbv56uWNku8orq
	WN9X4AgTqzEFq1sEh4IpT4iFmXWpswn/HplqV5nYe2C9Md/ds0oHj9S5rRaX6/06i8Hb0vqLjeo
	q07b4fIDyN2sI9b+/edFpwZhjn73VdrqwJKWvuVovuhB2cA39KdTxPv6MbRZbW3SKKkiD2cX
X-Received: by 2002:a05:6000:46c8:b0:484:3f43:4914 with SMTP id ffacd0b85a97d-485872a6622mr9310761f8f.20.1788591849363;
        Sat, 05 Sep 2026 00:04:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:08 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org
Subject: [PATCH 8/9] docs: kernel-parameters: Drop the pcmv= entry
Date: Sat,  5 Sep 2026 09:03:46 +0200
Message-Id: <20260905070347.25902-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0

