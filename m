Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794785248;
	b=OGkw8gjrIRHnL2nSuM9WuttRq8otyF6f5EUanwOkDh3r5OtXe8eQMX9Gi8DieG+oKyO/
	 K7eWDSSfXoHXx57jYsSr/CXbjTdO9hFtuKLyd++TdAH5rBu/wwx6ZqhhZpFSst2Jgb567
	 bEMIKK1+XEEPPojHuEoD+zb8sW1803A+3/Sa5qJguZcHqDRN12UkMpPR6zOV9QAilN/my
	 gQQN7n3bSRBfMDgq3sJv89OU4Yit5Zmtqgk27WbPaPOO92TT7yVm7UnL43NVkOmrcaQjx
	 julRpdSFB1YNH1nd/HhZero/W0nsMAcIDMWcZ6AvuL0n6M3IQRSRy88yZn3Si+bNSCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=47wTZZwmQ+jM+cYf57bWTBaV5mZlYHW+BTY5K/fBpAM=;
	b=0OI7dZRrGEUCf7EZcY1OP/3mNdLJHAcrveIMoiX3q2cm8h1Hgg6Kvi5KsSY+vlBLYStd
	 cj4LUW0fwJ0ER2qBmg+8kL5JM5LxzABa6s4KpKCfR2cLQGgifoKhGqbQKWbsXvDd9oNY+
	 SVYVg4qbGc9cPFop4h25KUyXZ87xG29KqornxfoSDDf0oj+MYfgEjx7nwQIEUDrDBgBjw
	 xMIqWRmqv9RTwC5s9Dflhd63qjmGuRZs5DVfcVod0H0Yw5YdN+kS+pjAof5a2cbbii9uE
	 uwmUlCmYrmUuP2K0jlNxpwLwc+h2ndomDljRTsvoZjXxOc3nWiw4NXkzvdIq1br0Ekw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=mJjaz6PZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3B7606A880
	for <linux-m68k@lists.linux-m68k.org>; Sun, 15 Nov 2026 23:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3B7606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=mJjaz6PZ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a3c08d6928so3807122c88.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 15 Nov 2026 15:27:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794785246; cv=none;
        d=google.com; s=arc-20260327;
        b=otSMFfWWsbBSRtJNkAxQ701MFnh6003kq8s73lmTGbX2cteLrhdqBz2dgjk65hN0DI
         Qx7XP9RzQHsGD+2/4T882esH73Nxe3E7Y4PirbmZchAk/y+yI9lOnq28o3ZPW1IFQqRz
         JA1OFde+Jz4kruCk9rEOHgJGU/BXg42BbGh4hTV2/odlZo3mf/dKY/p8J033pG9t1BXC
         zqLxERdq503ju8tr7vkcoM1/xdCB6qV16l6mDWmLgTeCNyeX5nfAvr9lHYZZNdunfzcY
         gUR48X6GCJOh+dn11zkpdEozpS+1cqNF6Yw/isM9FjvLWqlYS5ckr8EMo/Bxhwko4+H8
         a6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=47wTZZwmQ+jM+cYf57bWTBaV5mZlYHW+BTY5K/fBpAM=;
        fh=CTZZ8PL1+R5Y7hsnj2JEaxKmAuZKhj5y5EKEGG/NcIc=;
        b=VUBjBNP/YsiN2fgonx/pOFBsRon5RqDGCRSO/bOeLkKXZ2tovIEkWRzYnbPXAD/NJl
         0Gs0Sl0xARZqRse7Dvl+jb/9eQ50Xyo450iXe/qF2ubFORYY1A2K7IugeZvakQ+KxyLh
         8yuYBAoS0tsAEtwmtoStvQD2PsU2RxZlV5N0tFzQXk9okk6nZ8NoO3GdTMrDjkP7wtn7
         Q3d3wTbjHVjmsvmKkxe0B+nOEipTVa6cgklxyDh8IUoqMwctrqBaNDW/MB+GaJRkVJh8
         mrvae6C72qRdYoPCLfsMgoWMv503RZbJVule8RspR8zD3oqMrKEJaYmG9ytyLutL2sBT
         Jp+g==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1794785246; x=1795390046; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47wTZZwmQ+jM+cYf57bWTBaV5mZlYHW+BTY5K/fBpAM=;
        b=mJjaz6PZdBgwc0ylTo7AcqS/mZ1Hs3tZPcnBBxfzXgT4rmZdac85HsTiqoovPzRnOp
         RTgOUnc7zI1EcHW2LIzcfFWzR16qhbxtIcZQCnNBHusKyAhCTpfR3fAulGPNCI5oAbNs
         txy1zX/axJPBSbBCmAE+/YV8P1iH1+bZybuJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785246; x=1795390046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=47wTZZwmQ+jM+cYf57bWTBaV5mZlYHW+BTY5K/fBpAM=;
        b=V92fB0XgCL+LM8D12NSbLgGd6KID0vNQfAcpvQKHApco8/Bd9Po264JXkOU2nQknKt
         JmTXQBgFogOfhy8lKea/Qn1spF4dbdXLLvSf1WZasTI/Ip1s1X/hlAUUOhrq+aiB88a9
         g9Vggk/Mq6riNqorBibqpyztRxfVvN5FUzyQzr3yOq/5ZZ212iNGb2Hl2JrfdCh/UOBi
         wX4jlWSMbTBK+kgbmTwtt7DqaKbzz/GRVtADrTQfhe2uq3jsvXGUZQII+Ltvi3ovs3ze
         zLWzTJs41f0QSlw20pMSDdiwXGw71aDixFOXO83d5eDYd0HnYSCsj7VxPZhBZiJaVGLf
         8EUg==
X-Forwarded-Encrypted: i=1; AL+hErFe4IYqz8yZ0oxwyqNIpJKBoNwin1JXHn0a3IYYRFW+MR2RStuSC9fB6H9N7Qnrl2KAYXU8O0+0mpFZ@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8jjoF9fLFuI5ZrnwSwDwRNy2ehlZF/nRWqYd1AhAlnLPAJNozr
	tt3ZzJiCCcSNbrMxZIHlze7uMylU5AWpmcY7sVyDKXGhzbFRLjZGSM3Z4txR1hHDFxctCfKvK5E
	vZL0mFZNtHxY+p5lp90pCD9Goe5Uq9cCEWXvsxkSwow==
X-Gm-Gg: AYBFou0wT+YhWQjpPnNfuWkgfOFtxUsn95JNlgoSrzrduQ3OzE5B/Z4Y+iwlbEC66N1
	DcQ+F3PMtbPWKMorZNtWWCUujhT+g8Vm5koIkgUXNAAw9viwJK/9LGfI6Vfd5Wmzg0h8UK8es87
	xzsh+M5BC1k15GlrLjsDJpQE4Ib6R8v+wMMInfiyBT0fDOwmmREXcIByQPzIlMzX7WOrFYEzHzK
	IpBhzmY39s49UMFDkDsDPulEEUlbCFqoFbPhqYI+HcQ8TpkFEF8BReeF1fruq729Z0HXwu7Jryj
	rQp+xlF197+beGKmDV1JrvHWfXV79db0vi97MIPFunrBABRkC79PS0zT4hvTRibDw6zdR5UeoAd
	69T6NvQWpQ7Ul5qjriQi/ttDkg1nStXSSZD4lr+EsDgj4gfZU6HI5CKuHcHGgoYFku7vOeJM=
X-Received: by 2002:a05:701b:4354:b0:195:76af:b810 with SMTP id
 a92af1059eb24-1b5030bb5a3mr7686006c88.25.1794785245934; Sun, 15 Nov 2026
 15:27:25 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-fix_deadcode_elimination_for_tt_ram-v1-1-a6aa8e7cb90c@gmx.net>
In-Reply-To: <20261113-fix_deadcode_elimination_for_tt_ram-v1-1-a6aa8e7cb90c@gmx.net>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 16 Nov 2026 08:27:14 +0900
X-Gm-Features: AclHuK96fOtxc3NSBV_5Qd-n94tUSXWtAwifyRRI98RC4kg0CcyPEhqjiRVPeTY
Message-ID: <CAFr9PXnjcZBac7jmdySkZNd0p4a5MCNnAFGOqOgDM1_wW+b9fQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Preserve fixups during dead code elimination
To: czietz@gmx.net
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Sat, 14 Nov 2026 at 18:16, Christian Zietz via B4 Relay
<devnull+czietz.gmx.net@kernel.org> wrote:
> Fixes: 4fbdd56edf1f ("m68k: Enable dead code elimination")

That's mine. I wonder if this explains why one of my m68k machines
would not boot with dead code elimination enabled. I forget which it
was now :)
Your change looks correct to me.

Acked-by: Daniel Palmer <daniel@thingy.jp>
