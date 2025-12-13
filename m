Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ABE2C1589
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Dec 2025 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765616344; cv=none; b=EHn9WmJuaEZMtO8rLr5fd1KclvQfJVaRPcWnvlsMxNhbyLxyWSwHyhtYDyJ4AaCzhwN4iU2KPg/DzOclpdjvzc+R3u2dg/w8EsGrhAP1RtULR5lcsZ8mV++wssaZMAl/ROmxlqZeN8HikvpDgyc2hv6LQ3v8l/0uU55NrshSmpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765616344; c=relaxed/simple;
	bh=9qaxgdBedbMlAF/AiTFx9iXGeht8SIZnj9By9VlfdQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxuVP2UiBL0imED7d8R456Lb1BM2Bt2PvMfC3LSUWpHdrYWKRcBVCpbzZJLM8EUyWeeUFp3tpnFcnQfyG3+d6tDkaEmHemRdLljxg2qcgit5bMMr4j6HOrw82DgHkTAG9QbU2iRKsxkiHQyGNPJCt5r5hL+HXuoZviRfufg9H0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Ca/xgedo; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Ca/xgedo"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3436a97f092so3325493a91.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Dec 2025 00:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1765616341; x=1766221141; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9qaxgdBedbMlAF/AiTFx9iXGeht8SIZnj9By9VlfdQQ=;
        b=Ca/xgedoNj4+ic8+bmsXPZNy2qKe4fmCPHppvx3eTHYcClpNBQTHC6isZzdlZAPcDx
         Eh/bBUjH3TpCp6RmWuRyaTtOm6sqalSwiCYkbCYy07K8dv/D4Y7DX1fLgwSaSv1b7si/
         T1d2i0IDbfllTirxruhqkSmS5yLZ3FGjJKzAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765616341; x=1766221141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qaxgdBedbMlAF/AiTFx9iXGeht8SIZnj9By9VlfdQQ=;
        b=h1Kx4A2TapckKgT9MprwmUPBSlfrwfoBaNeATBWnpZJ4XEJQCpMcrc5/0p5+sSngXA
         /Hk2FBPQxqLlGGBwdCwxad0aLmPLovlqRU2sfbH1SUFyzVmsOa5uozbi7c7Pd8X/RE0r
         tNO0xoHxBWIXbs+wIsfTbiIooIcOCRs0TRoLPLTdJlS6B1trq4QjQAm9uEAqf0fRndiC
         XNsjeMmLC+UGrIIrktBfCC6ZvFVhAfGBbGD3sG+muL/PuizjlB/B0WhuscKTdP2njlek
         Qoj0k9BvZ3lanKfIQvUYNdxqT6ZZ8joiI7WWx1Utnd0b502vA2d5KcbQ+S7+MEozgPSL
         abCg==
X-Forwarded-Encrypted: i=1; AJvYcCXT5Mpqe6LX+b+ytUoJQ8rB8t2bqQWHJd9LXS/vK0u2TsUzb6DXehgvrUwwnkneCjgby+JDevx1T6nj@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyXKfikB8Z7Co29y7bg1F+r+rep3Yz9JzcNRSdzU8wcKdMhiQfz
	ZAqgmrLnTQ+vTCINp9bfUznrwrZ0OdNvsv+4udMqYgxie/A3vRkPv6fpXXgymA1gYfOM3CNizDS
	I0ljzPbS91OOBXrBfgje+wTGzBg1tLOou8pw8Xu7I4g==
X-Gm-Gg: AY/fxX4Y4yNJa7EYdHZ367mQPajiiX8WLdzaeFaPoSAHGxmatbg7176SHbHfjk6O+bB
	grHCoIRa4kjUqd4iypM5WgpqY6bFLFOIfKwGU3OBkPN6JEsQvBLuIBmd8ltQlKXyJGwCYGkQumJ
	hshqzESZWIOiD/+b8Xr+Ie1Y/4uCuwTWT39Ir5fAzHC9kySKrFe/Uuyk6Gqpw4911uo6UAhNgqg
	Pn4HvFGg2fKYlnGpwgBkEipTv+E5LMlNs+/TzLe70OCkDZrkQuzRTKlpaJ52Lz9SGmuEepZXGm0
	JvAWz1g=
X-Google-Smtp-Source: AGHT+IGcvTcRqnrAF1GhbpiCbeCLt5QtCPEN1oqvKA0Q2IqAn3s9igm0wH5C88AL3u7rdWC9UHGK4kCh3jkNmgEwtGA=
X-Received: by 2002:a17:90b:5348:b0:341:88c1:6a7d with SMTP id
 98e67ed59e1d1-34abd78fb40mr4344743a91.18.1765616341518; Sat, 13 Dec 2025
 00:59:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <478d5f080d74b6688c9e3f9132e3fe251e997ad7.1765610469.git.fthain@linux-m68k.org>
In-Reply-To: <478d5f080d74b6688c9e3f9132e3fe251e997ad7.1765610469.git.fthain@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 13 Dec 2025 17:58:50 +0900
X-Gm-Features: AQt7F2quHYGNkam8yo9yl_VA9WMmS2XR41fqKy3jvJJ0Jb3UfQE7ZUd1-cvOTzc
Message-ID: <CAFr9PXm8yY5xmEUesbtU1i_PwYF+LMs2nNGFbDZf=SwuomMPQQ@mail.gmail.com>
Subject: Re: [PATCH] nubus: Call put_device() in bus initialization error path
To: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Sat, 13 Dec 2025 at 16:21, Finn Thain <fthain@linux-m68k.org> wrote:
> Tested on a Mac IIfx.

I quickly tested on QEMU's quadra machine and no problems there. Will
test on an LC475 a bit later.
