Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44320306
	for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Jan 2024 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706398419; cv=none; b=Z54ChRRJi9vmdQ3HbcH5utomNXu2RNcyutxKuMmeqgda6COWXY20kNkWa1xsgg48NtIaJCfO2IeTaHII8F1qfqyxADnTwaIsMctkUy6dDLSf3lareNfI4/rhBkvzoWAWqzwZElbSIbFVwoa3lCYByNjymrOF0WU7Sq+hgS1m0xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706398419; c=relaxed/simple;
	bh=hjmnJkzs+a+lqTPd0afizO4oVAsHQIIDji+ghdide70=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=EUyx9W7JlqFLW+5TuOfratUuS1vfgnJMg2Ikn8HFAfO1OPA/WFzjglHMxGkvyZsOqsfMsFL/CrHIfzzaYQIGXiRUhYJu7AKbU5RyBJdDAkiBvBXFjKAhrU/gcm+DAI5yIwJTAB48Ky7jFSM3KnxsdJn8kSOmrl0n2l6aL8W4c5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=none smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley-net.20230601.gappssmtp.com header.i=@landley-net.20230601.gappssmtp.com header.b=fYRgz9Or; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20230601.gappssmtp.com header.i=@landley-net.20230601.gappssmtp.com header.b="fYRgz9Or"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3be156ca48eso220715b6e.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Jan 2024 15:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1706398417; x=1707003217; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjmnJkzs+a+lqTPd0afizO4oVAsHQIIDji+ghdide70=;
        b=fYRgz9OrNT3V3zm0rUfifhecs3VqrU4VrBdz9iJSSyJxTOS6suOjDWGiVnbn3xNCtT
         uIANx1tjKor96dHDO9JEU7uj6WeRflecC14QQ92Jyw/P67BgQEO+AbT2vBu49GX1gZ0B
         HFwz/1CAbj1AzL5d29vsvIqlW9lurl8aVH0THHCvfWbHlr2MqfEbdYFcf0BKQvu0/GPr
         KA7GTzpBxqcUqTpu2gW4neTFXLzXGwdwmOxcoEq7wa4rJ2fdH9VosK1VyI9ltcnsqysa
         +SYH2oC+oM64X8lN9v2/+gJzGRTTLCAdLFmdN4rt0/eyxgBpD/bwV2GiCYEQ41V1J1xS
         gcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706398417; x=1707003217;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hjmnJkzs+a+lqTPd0afizO4oVAsHQIIDji+ghdide70=;
        b=TQkVfC637NFjHtzaaYTjoch3lLEHmdpiNKG8YWfGP+jexbksZHutBF66JFPxhnNele
         85XArvaolrTOt6p1z3Z2beOIhMr9rfx4KItacQc318n+AarqjTTNRDcrP0pXOF+i3fx1
         52ztQwqoRCAn48dnzjYLDxfZE8n9PPg4XYrDkmETQWOFUG9lK6fgvc3lSCcZarkPREpL
         V4MavDWi9WiYO8f/1isDkbmGLREvkd2Zfj1VKvrUlRbisvfq9gzZnnE3KEgs80xLI7DL
         0n47EmcXrxm1dywhd+/Fro0nqKdjIf6kt1gll6f1eY22pf3JQr+qN3AZ2rtbUjsS4LHi
         ZNYQ==
X-Gm-Message-State: AOJu0Yw/X76ugvdEtKr+8nRmcclK8sOAvM2GpdiOBG76XHKXtxEuPlIi
	OZsr3BDyiwl2yYQjPWWFvflAPoUiBJ/NEEZ+N8TlIbv53Tdq+sxNfE1VIqfRm3Wrf4hVSVIGFfd
	l
X-Google-Smtp-Source: AGHT+IE39pu9Zu8kyuA5W3Y04CsJGDjKi6wuYDIKmtLQ5ntzT5ywr57a4UqgNF4GTCIQsfYJ7iFODg==
X-Received: by 2002:a05:6808:158f:b0:3bd:729a:774 with SMTP id t15-20020a056808158f00b003bd729a0774mr2376316oiw.50.1706398416658;
        Sat, 27 Jan 2024 15:33:36 -0800 (PST)
Received: from [192.168.1.4] ([136.62.51.249])
        by smtp.gmail.com with ESMTPSA id do10-20020a0568300e0a00b006dec024acffsm886871otb.57.2024.01.27.15.33.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 15:33:36 -0800 (PST)
Message-ID: <169c2fe0-36bd-5e9a-b37f-430ec69a686f@landley.net>
Date: Sat, 27 Jan 2024 17:40:48 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
From: Rob Landley <rob@landley.net>
Subject: m68k fdpic toolchain?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that we can build fdpic support in the kernel, does a _compiler_ exist?

https://lore.kernel.org/linux-mm/20220428033319.239341-1-gerg@linux-m68k.org/T/

I built buildroot's mcf5208evb defconfig and booted it under qemu, but it's
binflt, which I'm not adding to my test system's package dependencies.

I've already got an sh2 fdpic test system, but it's on real hardware, not qemu.
(The toolchain patches for that are at
https://github.com/richfelker/musl-cross-make/blob/master/patches/binutils-2.33.1/0001-j2.diff
and
https://github.com/richfelker/musl-cross-make/blob/master/patches/gcc-11.2.0/0003-j2.diff
by the way. I'm happy to use similar out-of-tree patches for m68k in the short
term, if that's what's available...)

Rob
