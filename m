Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620837;
	b=3EkjwtDwjXJEEyqWPCq2EWXPSkEqBytWzoWyk5Gl9yjD0Gveue5akFqZxnF11Kf1uBt1
	 1zu8VlAFNN8FfaZYLkQkvr+UDc/HR2MAMlLbcVZxjfDCIBugl7cLUElpIz5PqN5arYp54
	 rqOBvL1+sEaK3lcF3CbuPmWvgoONWmBhKJbjrZQ4b08rEpVkZanTWizEn8/k0LNJ8wXVT
	 0ElMVXYWVpHJ8zuuEtZlLzJ6Sp51yOclLAmaR1fIRiBdUTls3BpxSRp625o9nZunV4jHF
	 by0shZB9VzqkruAlwswR1PHG0YN5YI6QR4V0UxJoQXbAZHL7VMiApGHkQqkqbjyznAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
	b=QtxbR3yuDGFec3AX0CInlTnw/lLJaDCSehXH0E2QAGBuXlXwWkZxJZb7zfEtURQ1lqk2
	 pXVn/+tWkkoFkcOfU7v5NW0Q+g3UBuaQj2ETBN3AdTSxvrDf6v/Y2/ecI2Gfyz6e6x8l+
	 MYyKUYl+g/+OeDsxKGDvzB+QbHV/T3WdnYe7Y4bH1bTjJqaQ28gHSFF0HgXj7PMBMIo7W
	 gOm031WKipVxLBI1M9utF2CrPja/DFWakeZV9C5+zQuxBYxWnCh1rm84eJV+75YJzU/ff
	 b9MUKRxrZ10EIDL4r5/J15hw4NgZuYDta8t6wloADt1++Te6tuN2fa+PlK4mpEhHLvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=scmlHKrw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B487606A331
	for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Nov 2026 15:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B487606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=scmlHKrw
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14c0503dfso532397e87.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Nov 2026 07:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620835; cv=none;
        d=google.com; s=arc-20260327;
        b=i71yZN61w5rpj/oJc+zz3XkfyhDNxZ+BLKdFanRGIDGLVeKdsAqd78RIMyKd5J9K0X
         Lp/U73pTQsJZpYpSBtiEvsUWrAOSaw18gkCGQUp0CRcTSK21NfF+yUL0vSFWivfu/8nf
         33cH4txxS927NZZ8huThLy2bTAV5IQj0hrYXjGBQHhuH2u7VI5sr1ESW27ROXk/UZEuM
         Uu7YvAFjqsoDsduk+8QTjHI2TPKdmSf7vQHEPai2wWUh37YhOnvL0DHr+EwhbHYHi7VD
         1oP643ZxulQuYNu6ZwUbOE71IIs+risFYCux5q5tdwP+WshWpWshb0BDyncVYed6jUV/
         cNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        fh=jh65N5WjzNpX3HDPZFA99pj3uf60RMhm4YdHtdrJr6A=;
        b=Gy9YTMzkZZcWTkm38PJXUSDjg4H6idT5RYup1UhKj6ChoWbQWDDjV0yQIpPm+6KRQ1
         YqjlsFhX7HAISm5dqdlMk9WBNq9SPHMMGt4t3fzci/Hs9j+OjApii6POxwaiu9BihhAy
         jKurkavRM245oscdZc2WMBgfvuno0Zs9hlOn03qbyZno/cA2MDb6niGwRy5RCoOfyA03
         TIh+rbVPlAy9aRS4DoeMqK2jCaTErbdxzCPJ7Q+jQY7DmUCy8zMnqA2CLQq5Ax8pqkhw
         dKNrarztMNdoJxVlVHJVpMF9hw4EKcpEm6H+bnBzmr/PRM6wy3/frLhSNpXuN28u5rd2
         4BZg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620835; x=1796225635; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        b=scmlHKrwgURU48vGA46/mF4RZSUyWw4wmmjBHh/mAaNXBzbsRYZP7mjrVWR9fBm5si
         +83PKvHRxZOAYzbKmta67TVj7/nrJu6KmOhUFxCx09AKQvdQUsKrJ9WHOjpZQvBbT2/U
         Q8/FRzDZILeruOdmn+/53hc71S+XhBsRYbqgYKaSs0Qz6uc98qSDnyWHinhUXrDqyjZc
         bGl8Xid8olN+uw6YlHuyKuKnCAXmubVd13LtiKV+R1u0lQcrE3z10j9ap3lVI0dsOR5A
         R6c7z1yaAsjJGgT+wmhaAquJGIl6xBHaUp+RdWusTRCVQ+Td4In+Wgrq+B0U6TxLrqXJ
         cbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620835; x=1796225635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        b=ITqYjo4GDWYas53nemRbbzxkGOpK/dWqEEaOSTOQcIWS4Fv1a/7IfAdE2Xci7aM3IN
         rr3sffARaC0Dn4+1auOd3JOZ8H2FraAWtm4ZX9DhvBBycBoZEaJEqFbUFk7mD/zEnwFD
         iceBaUEI9Q4gpuZxx9ROfZPneJ9NEdKa95sTNMzbar+JjY0x8FY3oV6btHCZStkgFCJi
         MJZgXA4l67T8d3q7tKJlirl6jOCRg0yElbdyzsYwMu+EvsnsALsuNk1k0WyYqyuGvYcT
         MTNLE3etVgmLVlS9RWYQB2ye5vzHg4ZkBxLa7ToxBcThLgPH2grAsldx7UGgTubxCATN
         LCog==
X-Forwarded-Encrypted: i=1; AL+hErHst2lwzU5BNoynE3THOqUJQvCDUXZy+o2N+doUeWT5W2InJvb1CHtUYDlhvqVLkr7pUx39ojteQhWq@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9BhDVi8Q2eUDcxWEx5E44urnHBAC/mbEa47JFj3o2rsdn8xoQq
	crmc+74sCcsOVKHJF5PbXwozclC8SB72KRt/PBX0A3ReMk3i2A++f5jbfDgQ4qQ2wQtLq6V+gJ/
	4AYwRZv/DIolryRzrfmgiLWfNwwf4dXY=
X-Gm-Gg: AZFdTZfERvzYX9HFSJPIVbAhkCqlhN826GeUTiVpTOmkKaPTufQTdn4PVBuhDve9mJX
	PmJVhyGA4yuuxeTBU/3GXMPdNcvMea2DoyBLc6likNc8ALE65q+xOYbtCpUd0GIlHP/iLDFv/fZ
	PVIojFvdVXSleghzS4h3/TjYW5TaFcWpjbf/Gyw4CWARortgF2vU0nho6+tAuXY/5rDu7zFEvI7
	W9FB3i4yUYFTILYR3HHRIRm2rnKcepnBp7OBYWfCCmwOD4yOU3zD5dcLy6sSTsgveUPc3lcHJjc
	1EREmv9bgRPOv4kSyVs+jb/38Q2TZUnLGukCc1zzEAWlgK4JU6Df+DG98TzlIbQ+ZPfOvZWuWhz
	P9zXF/NJHFX7m5AH45noF35DF0Dk3yQ56SkA0R98IMH7g/HtdGIxRxvxMreH58peWb8i3fQejW1
	ZjSzce/viFzuRpK1tRH9WijZyE3z4vNHI7gSzK9tjeS7wPmjcJE9LR7fKLeZPSrOaKvF2cNpjyD
	mWPOPsicT3SuBDNUXu19J35jKIpENlLbvfg0VGwwfWYKb7/Va8jd4rPu3RcXUwnqa7KvNDS
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1bc785b7amr6221022e87.3.1795620835046; Wed, 25 Nov 2026
 07:33:55 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-build-speedup-v6-0-141a4f861c67@kernel.org> <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
In-Reply-To: <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2026 16:33:42 +0100
X-Gm-Features: Aa3M54rAUhOIl7nJAGzRxUt_IUS4JYfamPQ_n0qFr3V4ZOsnZoEMWuF3JwFrbDg
Message-ID: <CANiq72kdpY_tr0Gg16b24J1J-Duj3YS4rJ0CgNYVWQqmQv=nxg@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] kbuild: implement and use depcheck to check
 dependency timestamps
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nicolas Schier <n.schier@fritz.com>, Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 1:20=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> A dependency that is also a target of the same directory (e.g. header
> generated by an if_changed rule) may get remade later in the same make ru=
n,
> so do not treat a target as fresh.

One more thing I noticed: a header generated with `filechk` does not
have a `.cmd` file, so it is not covered by this.

It matters for targets that reach such a header through their `.cmd`
file alone, e.g. single targets like `.s`. For instance, after
building `arch/x86/kvm/`:

    make arch/x86/kvm/vmx/vmenter.s
    # Change an offset in `kvm-asm-offsets.c`.
    make arch/x86/kvm/vmx/vmenter.s

In mainline, the second one regenerates `kvm-asm-offsets.h` and then
`vmenter.s`. With this patch, nothing is rebuilt.

Cheers,
Miguel
