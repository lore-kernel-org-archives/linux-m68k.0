Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A6E1BDED
	for <linux-m68k@vger.kernel.org>; Tue,  6 Feb 2024 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707253879; cv=none; b=mohS6U4pqf/GF5TxMPemOKBvTWnxVGg5hRlCCnlS6FvBrOkA96TpAku4MHJdzSupEO2mdrrajPzkmb8RGQfVlTg82SCsWa5NoclnKraJPdyaT18aYsl8xC/XUSwBc5vN1UXyWji11SVCh4CO+MdpzGoJGqwMDOqT0tTKfs6kf4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707253879; c=relaxed/simple;
	bh=qrAk2eZIOXsTELaO9xYplxKtgrds5HQ6lgxtHkt6Ons=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Z7KQNxrt0VauqtWlIPvYRBLhbTk6UDGHXt5H9jLAxNY+wBY6Tdu3oEzq7cyYDIAwoMFu0SSnRXe/ZE+zcz8xOMUkjMfcMwn4Jt8PE0PtbWmu+xc7rSuB35WrcGeQiFkAWUpaJZhqh/487taMc+xpu1PC/2XuqxY87gMtTP7JzXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjxLBdBp; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjxLBdBp"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6daf694b439so1177809b3a.1
        for <linux-m68k@vger.kernel.org>; Tue, 06 Feb 2024 13:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707253877; x=1707858677; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/5KLgmbIUjmvZIGWrxz4ZT/J4oTOFM6zwe11Vgo48Q=;
        b=JjxLBdBphyXHo9GrHFnklhteItQY6r1kiekFsvQ4+BVEIiawbpdBvscicB0kzSyWKI
         37mm5DvKN8a2/BwXAENLfot/7Zc8uH8qdyPev2lzlrIS1K8jx3XuUgCKL3CYMs8OIBDs
         bgHySLrA0KKzW/+haJBOR+BSQ4jKNeoiutdlhWcx7lp8F1Jm1ddyIt0/SrlpaeDLRnKx
         ivi3UEzhrX767LATe6IaNaS9ipxhskeXXg775Te2ZJnv1RsuJ/vxsu4HTL+GUC4l0Xri
         /ZWxJNMLKUqSg0zCC2DtIwyt3neKG1TIUnGMavBGNt57GoRGzHMS7z78aolNKCexq4sc
         aOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707253877; x=1707858677;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/5KLgmbIUjmvZIGWrxz4ZT/J4oTOFM6zwe11Vgo48Q=;
        b=B2iftUtdFwVtUwcuaSzUTWEeSBSdQEnLpLnPqb6MbpyHZt/MUFILGgfVy93MCqUXSE
         YHzDXda70A3PnCtrsD4L+vvoYnmmxEl6nKOclAHsVZ77o3A8HTo4OSAVZFKLvNkrhKvQ
         34VzDbnOMhXesMSZbEi3qoWm0etnxtYNHBL/QAxl9kNmzlNiEVyeOXW0rBgdZgYnKKlq
         hQeIVtIQ7oHZ/5NeXSedE9P7RBaOgnWMVD/Ex5XX7paxq81FiRqOXJ4wDJ9JT2pzMdiL
         7QQPSFCxQW5USrZeS095BqGU5Tew1dC61a9p6/uXDO00NfInt33EXt2An5EeCzFStVur
         3M5g==
X-Gm-Message-State: AOJu0YwnvdGOf6PL0GqLUeOG8kGQM61M9RJVHXm+6mm7dVjsB3+657ZK
	uxDcE6HYOwO+SE5Tse7gfb4B1I/OxXfBS4VA1IP0Zme6JImNCKsjl7ws83rW
X-Google-Smtp-Source: AGHT+IHOUKTa0gM+nqKMKe0T5lrBqiuV06ZvF81a6dAbfTfnhJFTnuTqzwEWNAGa6cyD3yvd5aY3tA==
X-Received: by 2002:a05:6a20:3ca2:b0:19e:4f18:b953 with SMTP id b34-20020a056a203ca200b0019e4f18b953mr2590328pzj.16.1707253876784;
        Tue, 06 Feb 2024 13:11:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVZcnZX84VGL4fo940BFoUyymH1JA8j7DlE50ThzYhqECKXhTsQmdzTy0ar4Ts3wXe6Zybm8e8EJKLHSo/HTKVOCns/l2HdNCirmmggLM30F+9uTHDbr5ahtw6BzmjujOy2vNuOBhWMLTJTIE0=
Received: from xplor.waratah.dyndns.org (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id k17-20020aa79991000000b006e0334e3dd9sm2450669pfh.76.2024.02.06.13.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 13:11:15 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
	id 7FCAC36031A; Wed,  7 Feb 2024 10:11:11 +1300 (NZDT)
From: Michael Schmitz <schmitzmic@gmail.com>
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org,
	uli@fpond.eu,
	fthain@linux-m68k.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v3 0/8] m68k v4.4 backport fixes
Date: Wed,  7 Feb 2024 10:10:56 +1300
Message-Id: <20240206211104.26421-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

IP v4.4 backport patches for m68k. Basically everything needed
to make v4.4 work on my Falcon. This includes my iounmap() fix,
Al Viro's signal handling and uaccess page fault fixes, my 030
buserr_c fix for exception handling during page faults, and Finn's
030 signal frame fix. 

Patch 1 should be applied to v4.4-cip, or else ioremap / iounmap
has no chance to work on 030 processors.

Patches 2 and 3 have been applied to v4.4-cip. 

Patches 4-6 are a prerequisite for patch 8, Finn Thain's 'm68k:
Move signal frame following exception on 68020/030' patch which
had been applied but failed to compile (see error reported in
https://lore.kernel.org/oe-kbuild-all/202401310920.sBSI4BHj-lkp@intel.com/
which has gone away with patches 4-6 in place).

Patch 7 is another page fault handling fix which should be applied
(though I have found no test case for it, and cannot say how common
that livelock issue is on m68k).

Patches 1,3,4,5,6 and 7 are sent to cip-dev - note patch 3 has already been
applied! 

Tested on my 68030 Atari Falcon.

Cheers,

   Michael


