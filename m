Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BF031328C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470735; cv=pass; b=ePCAJ3XcOMkTTE1BkT2isruomQPnJYNhhsRN7LjIhxkrg7nnddi64WqdQ3jb7mtJXcVqjQJPVEMP0bILGynoDqVffUlsIUOuY78UaewB7SBE4F+oyUFQrWI5t+MMG/MIpTVbDrPv06BWTHCsS8E2uL/1DD7YPkeQMAOs3CjeG+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470735; c=relaxed/simple;
	bh=Vcj/jlizRJmi2EXdt/aWTfJdSBrV6aLiC1QJnc1gyc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxZUwHriDbpcJXoIyNTH98y7GFe+a/dYBSVfBAHaM906jO1ywhbVPoPz8kCnn0OyAHOsFN4eJ3zs1Cf57qMaDu0POKeauyifFWy6o5M8ZA4yd1XuY8AXYLa8VRE0S0u5SF066poAvUkM4AVaE+pOgQYqTv+g2zBwcuchNuFh8dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=dV1Y7EoU; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="dV1Y7EoU"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b4520f6b32so18281680eec.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2026 06:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777470729; cv=none;
        d=google.com; s=arc-20240605;
        b=I53TKOWpsiKapIBsPXasEpegKMPo6NESMezaozUAUb6SsLbC3JbxhzDHi3jKiXKHWg
         wHasSrH1SuxesuP/6UkfaBhneu9c2BehiiQ0pudjk9xMIlQZnqlhooMJhTjVwt/XZFu+
         AX7JCCucf3cuv2fERjFbVUrzdJLP2FXYNvMmjN6Lzk6H2AY1OXG0gLvC7uS7ysJkpzDz
         YPCJQcflHwuFrvImpmMMHJvXK6WkREOzt9DL222Wul2kjvGhdh8p+FvKdT/E8vtVExNn
         4JG2H6N0XcwDGeguHsX/fPUoybte7WDq4eWek6DKk/U5pO47/824HfYQNuh8/VdjFpHe
         BfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vcj/jlizRJmi2EXdt/aWTfJdSBrV6aLiC1QJnc1gyc0=;
        fh=a0z1ulM8YbS94XUWen1em1reotLOFajm0s/NEHUxJMo=;
        b=Gten26szTaT6/o4G18LowD+XmT1uo6DlbJZ33Xb9ht/gZ2t+rJ8tvDpVMLh0sNNXTK
         Z1AUL1FCw167nnm0+aCOUtuQVt3s1DN5yzzz42phZOomq3Glc/wx0a9bwRFiG3V+ct7F
         hlZcVc2RdLxa3EPY5M2N6iCH8fbAB+GyRPY4kqiWWLivhXnpibKEJtqBVYovarhKTIkN
         +irMkszGDK8t69/465gR5kNzuKPLmy9G4RD4BsoxtJcYjyiJO63PyZTaTk/n1ZCLxtdE
         0tLbi4I/Ehq17VrmT4cIWtzCc4R6AbF2kCugBQg4JL6lXNnGfZTej8rfDYMkovU2maFS
         hULQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1777470729; x=1778075529; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vcj/jlizRJmi2EXdt/aWTfJdSBrV6aLiC1QJnc1gyc0=;
        b=dV1Y7EoUlJQs6z2fG2JuOKqj5uFmIzIHHaYFXPi4qrehLOwFJEb1CDVva9CS4FvhPZ
         7mvOi5Hy9qGoM/+QaVPODFyJRmlyMXDk7wXY7sR8WDILfTGnnlIUuA8GAkUUoft9IHlk
         FzgH7uCyA/3S9R7bya4JhW3XF1aGYDHygc3bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470729; x=1778075529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vcj/jlizRJmi2EXdt/aWTfJdSBrV6aLiC1QJnc1gyc0=;
        b=LRFv+T+aVCed9hxzowF3q6OKL+16hRkOVnJZ0XplLFREtYm9Z4LBmKY4mk97Z6TC/m
         76GRKFOCUEvpQHmM1vhwxDXgmQMQbmbuSb34K4ImoV59jMWvLuk6Oc8TqPM/arqmwRBu
         mUxdGHrGVY8hRzBGdDb/PC5J25itoCgF0VJIzvDpWFtBh+fzgRzTc/OT7HrTmTQl2gFD
         g6Kpd+ewE+nc2xlSAx7aWZFU5ZKV+2M00TsgKkI4NpFT7TmsVOZlEpicqCWoUmodA0wi
         4DcNTMJIxjEsWsVGY87MgjczjO/vEBkdRK2wfe5biOqj3VRHrS4Y9MdCsffLYl1euXsS
         Cztg==
X-Forwarded-Encrypted: i=1; AFNElJ+TKn/TLjc3hNt+eKxlw4kaKxg7Zvq3MBgz3+2FSDKQbN3/yrmFESRkPH88aV3WZAPNrppTGqnvqctB@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwNdfHukKghID6PEVeerVAXWLKZP1WTiPXtLqQ1hq6PHgbVg0NN
	7aYZv/RtG4W6LqoJ5kUoJeFkERrws1YFwBaoWdQjlfLYMThuWmrpug+emU96nQW+70ki4qhswUt
	CR5cd/nS0mZZ0+YgxWURME+6IqyeROmi+IRKDNDx5uw==
X-Gm-Gg: AeBDietVvSpa7ZDyUFTXr4YlCqKxE8FkQhiiTQmHpimpe0Bwt3j9el3Eh1GpzWyEgfX
	9xmOaYC12IWxii2u0Q9oEB3fOjVSziXN0MoU1Izy4Ds0CEoiS0ZdQAHUW5M871OHqWQp9NTaFx+
	Hd/mNMKCA5TcIHx+hJnFnIJXzKEYpNBURGXLKy6gtoHvwTuYRI7yaac6phXEE/PBVGpw1zxHbK1
	xpGxTKKso/C/X/1AFJsZNkvoMqdEsVQWk6/6aIIonxUja5XEvNaqnwj9OVgRwyv8vI5v3v0l2Ab
	x+dxfSqMCLK/f+R0jSHr
X-Received: by 2002:a05:7022:f216:b0:12d:de3f:f3e4 with SMTP id
 a92af1059eb24-12de2a59d9dmr1339377c88.36.1777470729259; Wed, 29 Apr 2026
 06:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429124046.3480827-1-visitorckw@gmail.com>
In-Reply-To: <20260429124046.3480827-1-visitorckw@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 29 Apr 2026 22:51:58 +0900
X-Gm-Features: AVHnY4LZkGH0GYT9Uy0ZRDPAVwacyW0kO68S2UYtW7_ZVjCKOsFUrrOGP3b2h40
Message-ID: <CAFr9PXm0qxeSYq42MEOARKsmOT-hRLbT4UpchkwuSOMYKYzfOw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] m68k, bpf: Add initial BPF JIT compiler support
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: geert@linux-m68k.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kuan-Wei,

On Wed, 29 Apr 2026 at 21:41, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>
> Add a BPF JIT compiler for the m68k architecture.
>
> The JIT generates m68k machine code targeting m68020+ processors. It
> currently excludes 68000/68010 and coldfire processors, as it relies on
> 32 bit branch displacements (b<cc>.l) to handle large bpf programs.
>
> Tested with the test_bpf.ko:
> test_bpf: Summary: 1053 PASSED, 0 FAILED, [1041/1041 JIT'ed]
> test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Cool! Which CPUs did you test on? I guess 040 that is in QEMU?
I'll check on real 030, 040 and 060 machines a bit later.
Since you are doing code generation for m68k now maybe you could help
me when I resend my patches for runtime consts support? [0]

Thanks,

Daniel

0 - https://lore.kernel.org/linux-m68k/20251127000505.2117956-1-daniel@thingy.jp/
