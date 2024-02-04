Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727D024B52
	for <linux-m68k@vger.kernel.org>; Sun,  4 Feb 2024 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707074473; cv=none; b=lL8iKDgQWRUI95+96AG324jZTdFzEgXFuK52kkSkajQvqNeBH4mbH3upi0hZmkr3/tKtlmBlLOUGGPkk1m2b7JtUOn5zpCF38cb4rCc4DDiYfJVqKmIddB65uQCpr1sVHWsRHq5Tnpsq/Evq6RsaM58Z04XDCbGZegXzLeOIKX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707074473; c=relaxed/simple;
	bh=2cBTm4LaQc3+3BqBCpmeupJSeKlxpGV9q9+TW889bCs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=tqTxeIPhGnwDBOLOe5bmvZhUA/uaG6KPm9HUkJ9buRGWWe7jliUiiwJH/n/eeqyclfXklbbokvlafLLX3czavhMWsHaeoJqB9HfMHvNhzgvRUIh2s1yxlC5CoY2dLXY2UHbLqQdvaEAmWsCfd0O4YUEX9odBbRCXEAzLvew15cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iN5hZCrT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iN5hZCrT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e03b3f7286so151209b3a.3
        for <linux-m68k@vger.kernel.org>; Sun, 04 Feb 2024 11:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707074472; x=1707679272; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZeufD2evC1rij5m2sMbeT371TZAzkXdkacijTomClk=;
        b=iN5hZCrTZqKxUGadSeWBh9MgByywv1hy019C1wkJku4EQdSbz6jW8T/raer+0U+ZMu
         a7BHXwZZ5GsxhnUsEfNN81nf9rbfdmcnuXvSh6L0+JH/u47vJqBaB8UGP5WpK1LHLtSr
         HodumRoXObv9k4hVNz3jNvh9KZBgYwA/lHnhdD7/VRrWE0NMfavvbhEBvWdvOXBXmLSM
         niJQG9q9kAMWOUS/5+dFo9DWVAUXz0hhPUTl9BhSQ7cvghQjfr7Quv70L97drX/KJm5T
         ujP/WyPeER5OjndK1Y/0XjYFs1n2W30pU9pd8gKAav35QAbLtn2ciboKiW84Tw3+W6zF
         ddNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707074472; x=1707679272;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZeufD2evC1rij5m2sMbeT371TZAzkXdkacijTomClk=;
        b=tGV0j7tyw3/0SiOJ5lXt9My5+8s7v6he7/dNPFd64ckTrCjZ5Y61wG/IxTimbFuaMv
         Ks09I59XSDJU1mEsmWniIojrrgEGIgGfEn4YsdMngyovfTaE9XLqmWsDzYiWE+gRvHuu
         TTpiCL82wVlcUFW8zXNDSwPnD8gYY4Nv9CVWR/2OVh0ZCGxMiwGORHqJ/bjslqJXmlAT
         zJTgWShcvaYKji8wbZAml9n2w+rLxepYPWDzeiH7o2KDUKOvf/hEZuJyKvEMkkBK0ekH
         FPGGd1WhWliH0vQxehN8Tu4R5hswThZrWsM6LwnAQdciZ3xZ9eP/gJ6+ET9jOjpBOhXa
         wn3g==
X-Gm-Message-State: AOJu0Yyt1cQwgNFqps8CziJO+UiDH1LUOMUWov5DZVoEruSvN4eNI3FQ
	YWfsBzq/MCBOJM+G0w2hWc6xi/rJl3DfQTuVtBFwBCKBdyTQowuCaSvXbHIA
X-Google-Smtp-Source: AGHT+IGn8qiDK7kGMZ5tWcR1vL2woZ6HeycEPlwTqE9pZrrghfRx3e602qClSIoHTCbJynHJ7tlYQg==
X-Received: by 2002:a62:5bc1:0:b0:6de:1cae:a53b with SMTP id p184-20020a625bc1000000b006de1caea53bmr8440832pfb.8.1707074471616;
        Sun, 04 Feb 2024 11:21:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV1axxEZNPSQ49WZf6zApPZZIM/bbalaf+Qx6UusMYWOz8C12QLleiZSGeLSeGK650JXBhXKpLS/g513HimLl8GguvnSZmPK7+I7MaJPyHMyZJp2EhGJZMENuBBQYd6uJPaArEvzFgVtZB7awk=
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id g18-20020aa78192000000b006d9a7a48bbesm5084200pfi.116.2024.02.04.11.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 11:21:10 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id DBFCB36031A; Mon,  5 Feb 2024 08:21:06 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH RFC 0/4]
Date: Mon,  5 Feb 2024 08:21:01 +1300
Message-Id: <20240204192105.5677-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

CIP v4.4 backport of Al Viro's misc. m68k signal handling and
page fault fixes. 

The first three are a prerequisite for Finn Thain's 'm68k: Move
signal frame following exception on 68020/030' patch, and fix
the backport compile error seen in 
https://lore.kernel.org/oe-kbuild-all/202401310920.sBSI4BHj-lkp@intel.com/

RFC version of these patches to give Geert and Al a chance to yell
at me in case I got details of these patches wrong. I don't claim
to understand signal handling in anywhere near the required level
of detail.

Tested on my 68030 Atari Falcon.

Cheers,

   Michael
   

