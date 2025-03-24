Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF1198845
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742808253; cv=none; b=OlJ/44YdkX8PNa4EW2m9dmOkosEeoO25ThnlcL0udxhlPqpLfcbFP9EOvKIhm5daE5SNwveqQW9fPBjSTt3iuGjMB6FiH/NYNIbOoFldo8OinbS7SYnXiqOjkmMohghZ0CfIyxqIjZEY0qDDY/HIfVDSTiauaqErs4UF68WhjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742808253; c=relaxed/simple;
	bh=/5DkWOtlh5PExKlDAqKCsmgVBbScymR7T9AWiQdu7No=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T3L09mudcrtPABIkRKUVNq1wmiHf/kSeyedyLLNHGw9D+90zNUjARNbF1HHSOXcFxLETuy0NR6v77EvD2e/k+CjZHOMq795qTiF9U2NIfOnMYHzH1sJnETLmgMLuUVU0I93/t+xclrQrVRp6I/+f0NS5aFcLfGBZ+cijXr5n+Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSo8Bhui; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSo8Bhui"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso25733155e9.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 02:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742808250; x=1743413050; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQ0wnKYbV487dq+b+o1/rxjti8vI/jxBBD/gFZexICs=;
        b=eSo8BhuizHMVXst7kPrt5mHcluX1D0OlJ2RY2EPattjT7vClxPRf7KokvKKUNySqb0
         UuXJREuwhQ8ICGFX3573LYtNEEerXdTctSNLu4G49gj/pYysmHeZHPvIZaWBTvIzaRU/
         35w2zgatdSdiSkuXKeo3+dvCPcTHxeJxpqc8jnfB9K+0ICPxULNsARtQ8G0xQWcjUmZ8
         rLvwQHXrHzO3sqIfLR9lZegLwn7QDJHGLocLy4P2cpoEXCg2+sWrBVTxCfcnPKoi09Jo
         fptPbqizbtUckjQwnH5lfQLaYOWaUs3yVfDpywbzJGE3doQSyrpUEYrnPj0o56j0AZh9
         4XqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742808250; x=1743413050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQ0wnKYbV487dq+b+o1/rxjti8vI/jxBBD/gFZexICs=;
        b=fIAOTQ71Wf+KZQonqLzf+TXBM19LBb0RcPRqI97AwUH0eyAuoGxDHLxFJdy0oeOmq3
         Xt2NqFxC9NKfIf3Bh+wG918AFSlJEaSuZI7B3/gfUNAkilyjw1wf85Ng32wKatv4D/rJ
         5EllQ/VextUiiEddn3DLlsA0n/x+cVR9DEjFrYoYHWZDtmRoJJoYZaQLykN+hW3D5JFf
         R1kxKeM9Fs/qUuUPUdqcpySZJ5DDRLp7r+RzD14sEwrUqqywkbNt3CsE1X8UdSe5+n7P
         ACyM22SoJJXeJ7krPd23C21jKu0jXs0qkQ4OqjN2lYqaSpWjvyAItKeqSxDYFRcbjiTN
         b9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9XbVuUe8HphEVmJ7qYsvavqH2eMXk5DO08DMwr2zN0W/kpBtmxB/gOVm6f7gqHYLIY3YGoEx6Ovhy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyZrv2blAMShBa4uuqLNliu7FbR+G77QIUCacfjOBw8YeU9q5EG
	O2PoaVWylRdYLnvw9YUfmabkDAPb74RIMRgbvBxsc0DjMrJLk2ts
X-Gm-Gg: ASbGnct9DujvS6phXOxcPQhiqOMKO1Xaf4zLToCgYMBYTpZoz2u6EPIz3uqRkDzjIB0
	k8lhJaMiu5AzjL9IstXY8XLs4hSVl2VBsLF7DfGxEqqdYEAfMzmWhYYTotM8Ba5K52HB09mw4iA
	ThCi7BqvVwPtBH1kZ4cjQl83+g+ysNZ6A5VP1ScBh/uSsIDwkj0904rSgVDIOL9s9YE2ENcme57
	TDIp3cfir/DCZy/0OeQbCbxc4mUAMVS40uzn0Figb2lothig/VNCGpNJJV10eASsFnxLAN3d7Rn
	7nQcmAHl/5WV98xqWg84CysjihsF135QcHpPK3s9/es=
X-Google-Smtp-Source: AGHT+IGj6NFz2IizfSUALMk8pF3LBDcOaRaMhYM9d3l4Vt/DzpUttY0gjbOxHsxLsHP1hGgJnUT4KA==
X-Received: by 2002:a5d:59ab:0:b0:391:43cb:43e6 with SMTP id ffacd0b85a97d-3997f937c30mr10944042f8f.51.1742808250368;
        Mon, 24 Mar 2025 02:24:10 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:fd58:9303:2c1b:4279])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd27980sm115645745e9.21.2025.03.24.02.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 02:24:09 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH v2 0/2] m68k: pata_cswarp: Add Amiga cslab ata support
Date: Mon, 24 Mar 2025 10:24:07 +0100
Message-Id: <20250324092409.99430-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is a driver (and the subsequent defconfig change) for the pata/CF socket in
the CS-Lab Warp series of Amiga boards.

Change in v2:
 - fix style, remove duplicate swap macro, driver version, etc
 - rework the zorro attach mechanism
 - remove the unnecessary zorro ids refactor

Paolo Pisati (2):
  m68k: amiga_defconfig: enable PATA_CSWARP
  ata: pata_cswarp: Add Amiga cslab ata support

 arch/m68k/configs/amiga_defconfig |   1 +
 drivers/ata/Kconfig               |  11 ++
 drivers/ata/Makefile              |   1 +
 drivers/ata/pata_cswarp.c         | 189 ++++++++++++++++++++++++++++++
 4 files changed, 202 insertions(+)
 create mode 100644 drivers/ata/pata_cswarp.c

-- 
2.34.1

