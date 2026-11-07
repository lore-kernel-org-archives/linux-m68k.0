Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057872;
	b=XpCXGW4jcTfPyv7kfHTsNF8eL9g4fmI6K+nFiNaM1osajIFMuzrY0sf2wAP4gQTusB3r
	 MI5mtLh2te1tu3AERiJ2/g5TZTeljWXL2FzAAqfWuBLtkrxrfkeodNlS/HnvneaYj8jHK
	 wUb1HqVH7pqQp8N4cKkai2IVk5oqhp2JZFLpQV+Bwzfov3uF3EAdEI46nY9CSm16GpzVz
	 uX9nNLHQ78TLDcOaAqK617RIOlHj7xrUTwjkWWTTxrGBtTaC94swC9HlmyHpn5qUpIp66
	 r7a30kKF6zPE2TObyc85FGbxEz2LPd7T96o/x2Ks5euGVCix6RHKitpjNfppYMJEqRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057872;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=w5/HjRxfEws1ZhLacX/MfEaZ8CSoKsLn7i3uFe0iH2E=;
	b=tOugBF8gyUBoUC836OMoM2rxcnIszF1a3Y4wg0dDB/pV6cP9awyLvyPhA9qyK6+bxJVC
	 MTmpKbHWEkDiBQn6JUTBpCk2VgvXkCMQUPmHvCDPsCwnpEW9pNrMCvOrIIQfvyxCxXJEC
	 1ZyWrj5kONM/5oNx4GTWsnbeKLo2bmvnWmcYvnPfMtMm1U1mPVm8FKz4wD6sFsdg0gTkb
	 KKHZcd++FzyoKvN+wvFxI2TOyZMdHnXmIeKcC6NFO4FpYusLJLxhGnH7RP9VzyUxNziKK
	 hV1tr83t3lcrSXd74eF8LfLdpyKVplcf3e0U6nGuguFA7ACvIVoyUtk89LGVN05vfyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EPgIMQHv;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A5B606A331
	for <linux-m68k@lists.linux-m68k.org>; Sat,  7 Nov 2026 13:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A5B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EPgIMQHv
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1F7560202;
	Sat,  7 Nov 2026 13:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693721F0089F;
	Sat,  7 Nov 2026 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794057870;
	bh=w5/HjRxfEws1ZhLacX/MfEaZ8CSoKsLn7i3uFe0iH2E=;
	h=From:To:Cc:Subject:Date;
	b=EPgIMQHvfrEV29OCwu4vFqA6j95c8YcPIMJCvB0f2MODYlxds6Be+Q7bLE3LunJ7t
	 SuUQ+Vh0WJRzLdopEaUrK7twiY6kTPNYiwYVEvjyMrEC9jeLZ1b4S8MUuZWJg7qNT4
	 Qcfrc9jR3Or1daiWYKbkaONTl/toaRoPnxg8yX9Oyqa/Ofh+NvwJDPdo9laJXLIo1a
	 DQq2+lRwL6DfYndiF+h+36P5LayRLoL+Cx1NurkWtXPM23dCHXp51Wn7g3b7JbcwNt
	 vG1h0jlZC2/JN6bGVJuNgbfr+oYgsPMNj4rMiq4mDeKzrIRKRA5tVlg6lwBLEkpA+0
	 hhdfsfm9kEnZg==
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Thorsten Blum <blum@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: amiga: Mark amiga_model as __initdata
Date: Sat,  7 Nov 2026 14:24:06 +0100
Message-ID: <20261107132407.340796-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=618; i=blum@kernel.org; h=from:subject; bh=4zvtpkv2oO0GKzkZ98n+/esaTM0D5jd2GoWdYySuqao=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnv1crPLFvwpG3xkps9e2RW+s1f0rTS4Hnh6sOcieLda 67e2SNg3lHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATafvK8M9MoH9L87aVN8yD hW7565srLhdc8SSxYrqkwCO/MgWjcx2MDL+6dA89Z7bgmX96qX7f8UvPbgpIZS319rR4vc1um1p yAQ8A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

amiga_model is only accessed by amiga_parse_bootinfo() and
amiga_identify(), both of which are __init functions.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/m68k/amiga/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index e2869bb4bf5e..df00f2e33932 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -39,7 +39,7 @@
 
 #include "amiga.h"
 
-static unsigned long amiga_model;
+static unsigned long amiga_model __initdata;
 
 unsigned long amiga_eclock;
 EXPORT_SYMBOL(amiga_eclock);
