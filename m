Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE341144D1A
	for <linux-m68k@lists.linux-m68k.org>; Sat, 16 Nov 2024 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771644; cv=none; b=C0zwS/itF97U0jEvzsGtjXFmpQ0HvFYYont3ErPg5hDKPDfw7vjRmEuIuACkLvpfaU1D82V/skezPE37VO71/mEpeLWRAWgLwdiSFi8ndbGDJSCDXjVyFKGxNwbDSCmbBOf0jDXIw+aQM9/NbZPHmcfeG3UPlUFmkox2Y4ticK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771644; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=DwqLJahWqb4epln+vGj/cPawAns2mopVcnCK1rR9fuxhlmG3OPL9TXmFQBdRubV0H6nLo/KUt3TzQcHVZqC2iwcI91Uivrgr49o9HOFJye18NM/x9/RFMiRfuOnjEMO28TLvgMfE9Hcoxv3oEjoPpSJdVUnYlS9lnJfRv5D+MI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfGj/vaw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfGj/vaw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c803787abso23095525ad.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 16 Nov 2024 07:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771642; x=1732376442; darn=lists.linux-m68k.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=XfGj/vaw8OVQxHlu/8M9vribgLsdU2a5T72p3MUHPRg9dgmnK4REAZw//4qj0Cg9wH
         apLVAxW59uH7FmOWNZWroHXn2Z8qkutPDIdLS7+WX+H7cdoq80hd2LQf7mjQMGCxJ/D7
         0eV0OiwZeCNIP+3k+4yADazH4XgqHrKSB1Ebta42u3sw3CvWns98VT545o2K7I42UDK4
         SIoz7zwGN6SLlJoeVHZA/x1D8q+UPuHyG+DeSGl/tsfnLV7fr2S2tlbfXAtYvm+99aVy
         GUgKYVSrQWnDHWor+w8IppvMKM3m8teEpLrQZYa81s/xUF1wq8LsVCLf+TQEVu5xQl7x
         kA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771642; x=1732376442;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=Q2Pv7OExBXwBAM8uUfdfAY99zcpq05xQEgIA2KPWANHPvmm88f2knxlgOBHsSbp239
         82fd0pmhO2b+9b/04EjE6SF/8w1QJa1rUzJK0/Y33/C3CeG+exyATJTuVCADesOJAtuE
         L7OhsIBqc0uYVa7Oa7j3+poLXUaiv0gLng1r0Z7fpaT1xerUn8t/qMvwwGiJn0ZW1Rhs
         RbWFlplMlpt7hwe17iXoPNPnelhUxsltAKE+3v6leEYMqw2x3hRqVUwzQPhZnTgVLq9y
         NaJGazjsesqtYDcRgJtKyOoSWHT/E7Tp6x4L+9wZfp6rgQb3M7X2UtsAPvYWTovAuJFf
         aoCA==
X-Gm-Message-State: AOJu0Yw8wiciGU4GMJyr/hmulS+XPeY3eOBjyp3q8e5HZXbd74K8qzB6
	Ak9q8T1SSCF7GAiN/FG9XW+Io8Xjq3PTG5vfQOcxkMpiFKjs3/KWAi6f5A==
X-Google-Smtp-Source: AGHT+IHoT3XP//ZzEh5t3YMzZ1WxBP9TlZTTARcXMQvujORhoftwp6gJELH+iKJKq2A+sWKZE+VIfg==
X-Received: by 2002:a17:902:ec8a:b0:211:6e93:9e5f with SMTP id d9443c01a7336-211c0faae72mr179043235ad.22.1731771641575;
        Sat, 16 Nov 2024 07:40:41 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211ff135582sm6182075ad.48.2024.11.16.07.40.40
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:41 -0800 (PST)
From: "Van. HR" <tladitshepiso06@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <6c0274ba672044502a3e237cee6ab9940258d48cae2ec2803f1dfaf54a32ca76@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-m68k@lists.linux-m68k.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:38 -0500
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.

