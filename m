Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007471;
	b=zTVrOaRoWQJOxUglAEjkAldiIOZ77VY3VOTuIiTr73YWPfdJu+Gl0EXw1s4NVhFuXwOT
	 iBhS378pmyWhKoEoZN7V4SuFMTP1Oq/ruX8ze7MQ8S+2snAOcxahHmyVCyKWa1z3ij/od
	 FnXHS326zaImumRWr7H0lvJiOUmdiaswK2xL/BaUIhqcPSqQBDREdBbdsS6s1WPZX/F3e
	 hftxs1DOmrdChpkxnbJntgJVbwHhRMvQHXDsoi3b+8OVe6euA+eaYw6UWQdsrZu4cmWm+
	 m/fySkoRKF2+7642zo5LpsQJCeFzTJ89ERSDknZT7CL5gcOMLxfnj+BXg5HazAqr+iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007471;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=NkXEUIhQ1Z3ot5a7eMpceB2+VBrP+YTbbeFRWzqVBFI=;
	b=yQB859coSVOQ1HtmKc3WQIpTBwubIzYZQGBEb4aXKFWDYq3D+qbCAfB80nGevOUvQmUi
	 4xZmlcwStM7TY1nYFjmekp6+VvrhCjdA7be3VJHeMTD2W/XBjzXr/CaAGavxyfFAP+w3I
	 E7wJD/rycyWuBEvVWCNtNAbDy/3pm9Ci8EhCivdbF60DvTcD+qQKq1a4H9FphhI3Zr//Z
	 pV6TWLdGIzaa80+eU4nicuIS6RdFm5PL0zPdOAm0PuNJ+jlUYFu3caGeHU96Yd++3Gb/A
	 s0zpJIatPwZ/1suwcYgSPogJk86pJvExgAfWT5gwyYm3h/8r9NjUm0ay5KDOlVLjcgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kUtN/LB8";
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5E6606A32E
	for <linux-m68k@lists.linux-m68k.org>; Fri,  6 Nov 2026 23:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A5E6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kUtN/LB8
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C39ED40A77;
	Fri,  6 Nov 2026 23:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DDD1F0089F;
	Fri,  6 Nov 2026 23:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794007470;
	bh=NkXEUIhQ1Z3ot5a7eMpceB2+VBrP+YTbbeFRWzqVBFI=;
	h=From:To:Cc:Subject:Date;
	b=kUtN/LB8SEN48X9u6PxuNYFxzvZ+q0gsG4PCr8NZ1Ta80/4V+LrA8O1ZQux+vevYh
	 hMyMoHTdKWM3hve6zQ7/mPcfpUWJbNp3+tzXvfViaYGG8egzaL8crtjTNvhEsodcdj
	 Z1s30aWRzCWY+aO3irmKuM9fWzSSOuLD/Ywrddj9qHPCD7/lWziEzXAEMma5cN2SfR
	 PEedp1TQ8q62/uzU4FnkfZ26ylPj01UKALCVCk51ZVgykS8QHgo/ILDQcuJSA7J/Um
	 GbwmH5zAbrYs0m099qxCZanAu4d9GgogOxd7KGJ03Pkw3FL8Cwp1NJtn0nw2838j4J
	 7xIS7Bq/pl2aQ==
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Thorsten Blum <blum@kernel.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Miro Kropacek <miro.kropacek@gmail.com>,
	Roman Zippel <zippel@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: atari: Reject bare switches parameter
Date: Sat,  7 Nov 2026 00:24:03 +0100
Message-ID: <20261106232402.278217-3-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=blum@kernel.org; h=from:subject; bh=SU+pfClfZ+7Y4kvEdlhMRIRIQz9VQUnQe5y+FYA3bpc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnvEicFla56GiR/bKqnqKT1hBOGp1aYvVv+Ir4v8Z0R7 6+eLg2zjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZjIzCmMDOftMzjkH01gF/vI Ldp24e3bgD8vZmQGmGloxcjz9ITdOMTwvybXa37j+sVvPkSdfHyv//+aa/Lnv9+QkPm1KnmnxNZ YAw4A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

When a bare switches parameter is specified on the kernel command line
without the '=' separator, early parameter parsing passes NULL to
atari_switches_setup(), which then attempts to copy data from address
zero to the local switches buffer.

Reject a NULL argument in atari_switches_setup() by returning -EINVAL so
early parameter parsing reports the malformed option instead.

Fixes: d6713b4091a9 ("m68k: early parameter support")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/m68k/atari/config.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index bdafc86241b7..b82bbf93d8e7 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -149,6 +149,9 @@ static int __init atari_switches_setup(char *str)
 	if (!MACH_IS_ATARI)
 		return 0;
 
+	if (!str)
+		return -EINVAL;
+
 	/* copy string to local array, strsep works destructively... */
 	strcpy(switches, str);
 	atari_switches = 0;
