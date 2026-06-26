Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BF13F8224
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782481813; cv=pass; b=dQ9mlL01Gu60yYrHAi4Rehgxcm2IxTrquexsqRfbxrOuldncOoAG4wEehF14zGSmpZ4yi+5mYe4/Rjx2/3jeJHS4mtTUsfANZorPpvWZ2ti8qlvDvTv0WIh3UrHvV7GRVFfdGtzfxdMA61eUVM40VY64/XwFU4FDlbifb7urADQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782481813; c=relaxed/simple;
	bh=xyhGnmVBmcHEcjANt3h5rplzmix+3a+CjUNvfFWpNFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kubMsUOA1/XHhn/G49lvHew/cDJlA/Eodms9KvIznKe0vSfzwkbB9bc3SxQF6O+BM7lnxkNSxRUDTlxpPPAs7LR4zZ+TClOSU5OVGVE42I5bmdz9Npy1eBoTxaWbQNplepw8VM1NoqtqM4pjWmttkP2AnktSCyEBNxOHEijZ6a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=M//9t25p; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="M//9t25p"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-137eb0d76beso1199800c88.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 06:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782481811; cv=none;
        d=google.com; s=arc-20260327;
        b=h/KnT95tW0GLJqTz3FgXKFMPk/DalcDTCiHuYichx9+K3N4mMrcjqqLjlrDW1vEbL/
         s5SoavvXEyqYqwihNaNyRYeZHkrfvl0UdLlNU/li1emgiEIqpERjMHZD4kLsh7LQrRrf
         ObPknIUXN71s30vLP2O8oi5faB/yhcl5mEj8g+yYvWWULnrk3b4E0UyNF30sy2Xz+dKq
         qDRUx2Ov1FXkV+aX11uCXTHobz0mW/qWVqBeecmFDF54C1mNPgoeKyUVHqqYveLF4OU6
         4A0z499Kb0syyWAD0F9bLiERh6oxPNKxCXFO5OzstmLqEHvfD6wMYox0JbMxVgKLxo9C
         ZEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sNLpZ+iSgC3g/RxGeOTthBw9daEIYDuD6SiKvrm3GAs=;
        fh=0wObBPKyCh6itawC2LeD7g73YheLgAXz1FoiaqyiPw8=;
        b=dnR4zd/kG6snCI7L/1tEGpN06qaGBZVzj/Noio2YbDnu7yCcuSS1/bA7l/2a1kKJqA
         +6vrGp6j982iDL6SM2y8F0jrpPQNYnGsugS5muRn11Ecghmt559FLXmpC1uZvGXNX6cM
         h8zSmzS6/ATlAPTwlrPtXkLncRqDWpwF/vLZM9wQWYBMBs2bGtzujCqaVplo6BgEJhFC
         UR4v1ahD8BQy0c8uglF4k+RGd9LGJEAn7cNlZwtJN7eBABqFJtiWypcqxtaCpdGIkplD
         g7OiIuAte/6n6dXvwwmznLZs2BWH2pw6Mo6KjztZQlzIEkSKFsrnpKX0+GxFs2C/QCph
         uAEw==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1782481811; x=1783086611; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNLpZ+iSgC3g/RxGeOTthBw9daEIYDuD6SiKvrm3GAs=;
        b=M//9t25pTgm6I6+IF6OthC0bZAQvaHUELOrlXQIjo5vM8ehqSNlxTqHYQSvxBa7dRm
         AsxvUg8kPLMi5buZx4WWSjz3K11o7QaQTtl/xX5FrIJXGePeMuceTYQhZXHp6LRzfrd6
         2lhtZIWz+gOSuzZVvg5YvdD2S3HM/gH5HKM/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782481811; x=1783086611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNLpZ+iSgC3g/RxGeOTthBw9daEIYDuD6SiKvrm3GAs=;
        b=pY5syRTFL+43ZsynxT+vwdzRi87hvEuDKEh1M5VyOaaC2KVYaf2PenyqDLIZgPftAn
         TVW/xKe9d7WMqxW5+9omc+wX230l/2vEsGPdqH8NgtUhC4JNh46gGGJy8IA9YbdZAsZq
         JWWeWU0f+xmh8uUKTn88ntVFll/8U/m6/n0hQxZV4AralAXIHpJUOt3LCJ2hGy3Xx0/j
         hQrQkqbGzasMKRqR1p1mlJL4nTboPVHMeOI/035qQsyaYaYRM1+ywfeH8vhvnBczLNs6
         EBQA54qxCqNvo7SNQ2xb2LhUwgzTbpp9ERMKPbLv42wqQOEmpQBbp36Jz1mBSFL268MT
         WYLw==
X-Forwarded-Encrypted: i=1; AFNElJ9qxVSltHoYjtYLtH4tLGqC/O8QoQchbv0nTEIdHyISyawOP7lWdrPtlnU+gu0xJVbwE/bUEu+3hq9N@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw1rk6TXgvlvGYPmUB37KbaOtMEcqgOexXyMnTYzVxpCqAYxa1J
	3KsUg1V7huJG7Jq6hO/hn1i+tG2Y0GvtT/8iI5DWJLhE8kz/NoPZqfq1avsJ4zCbVI8l3MNjOJc
	wJsromTGdKzqTR09qggLwhgsS84db4NitQltdoxO99A==
X-Gm-Gg: AfdE7cl3HeutenVEs4Dhml/OHJ7BMa4lVtMu+0/yYOpI5mlRjlZO8BiuRN5tNdcI3Gc
	+nSZzyL+iUoOw8U+0/VdJ9jBWIi/2Aj2y5AZc994Z03xv0r0aLpa7vtKHgBWxknjB3bKaSiQFQi
	82gHFlbkN9IRnzPFd9/VWnCi13Y6RbqoPE4ricrkkloC3cihchPDciBvn07YsRiiVm2+IBEUe9o
	ZEg4+9Y/bJaOanhjFzpK/rst0dQ7wj6HEs8irQIbKINc47k89dQaFTFrcvdeWEGgGGCeUdb
X-Received: by 2002:a05:7022:527:b0:139:ed5d:1b56 with SMTP id
 a92af1059eb24-139ed5d20bfmr63875c88.23.1782481810767; Fri, 26 Jun 2026
 06:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626104142.3782-2-thorsten.blum@linux.dev>
In-Reply-To: <20260626104142.3782-2-thorsten.blum@linux.dev>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 26 Jun 2026 22:49:59 +0900
X-Gm-Features: AVVi8Cef44ZwgL0LTBPIW3I9tZ-rE1HpkmlLKPKNMObf49sA_T5n5z5iDvQSE7I
Message-ID: <CAFr9PX=gTnsBi4X+cFzMM3vfWE2mXO2ARPOEYe+ZWVJ4JWzPvg@mail.gmail.com>
Subject: Re: [PATCH] m68k: amiga: Mark amiga_reset() as __noreturn
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Fri, 26 Jun 2026 at 19:43, Thorsten Blum <thorsten.blum@linux.dev> wrote=
:
>
> Mark both the forward declaration and the function definition as
> __noreturn, and remove the redundant redeclaration.
>
<snip>

I tried to build and boot test this on my Amiga 4000 but the build is borke=
n:

  UPD     include/config/kernel.release
 UPD     include/generated/utsrelease.h
 CC      init/version.o
 AR      init/built-in.a
 CC      arch/m68k/amiga/config.o
arch/m68k/amiga/config.c:546:1: error: attributes should be specified
before the declarator in a function definition
 546 | static void amiga_reset(void) __noreturn
     | ^~~~~~
arch/m68k/amiga/config.c:99:13: warning: =E2=80=98amiga_reset=E2=80=99 used=
 but never defined
  99 | static void amiga_reset(void) __noreturn;
     |             ^~~~~~~~~~~

GCC version is:  m68k-linux-gnu-gcc (Debian 15.2.0-17) 15.2.0

Cheers,

Daniel
