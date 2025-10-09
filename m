Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1642F1991CA
	for <linux-m68k@vger.kernel.org>; Thu,  9 Oct 2025 02:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759975828; cv=none; b=I917r3LtLv+3VkLH9tNMDYaw8GeoceRsOcBmTo3bDINHABqKoMvGQAzX9ec2d8jy7Tew0THb860bRr6VdPjkVAZRPAZgB3J8QiZW+JGqN/gimlBlDxe2PmGTh5UicR8zwwqnQ29uN+VcM/vwDMK83IVywH+9KzVYjX7K+B4UdR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759975828; c=relaxed/simple;
	bh=UsphcAlBr+S2PNdLor0CBPJpMS317Bf37KWc9NojufY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcvW0rDqt/vsg0ohJwscxM10CKkCiA/UjOGb6ew82g3Gwya1rqTYkr4f6ivY1ED3TdxP0zdorT19P80HCuEmcxFKlAxIewdX7T+0YWYnLL/Wr7ndiP31j9BBmk2jOFX2icPcD7HW8UTHaanBfawnEdsjIwy0BSbFQRqU6C8GVso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqlipTji; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqlipTji"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4060b4b1200so505589f8f.3
        for <linux-m68k@vger.kernel.org>; Wed, 08 Oct 2025 19:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759975824; x=1760580624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8GzvFR6CGlZo09XYMPTCFUeNcSQI8ZtZkJiYSRu+iM=;
        b=UqlipTjiLUj101xDX5T9dctIDy9tM48KPUK2833DoHMj7JN4CaT2sWv+hAHltlOC99
         0i7tXNVcthX9GUDm3E8TLCh2bIY/W1Wsp/WkKOwLL4Dokz2qkSx9wAH2BUfASd5ZtiA4
         3SFe1Y/rgwpVHvxHMP76BQUDtIVPzOo6/6wj37vpprfzizUfoZ0m5DT+vncBq3Hb+K1j
         DglfMMyowLBZMW9rP7AS+2uQnH9wRQvPCwVbl6Sybrjdq5uDML826SqXgReeLSQcgJZ0
         Qc6s2sB1bVFjkQ9QRj46KyGSsK/eMW1DoyFp7frOWPXWKnAbNG3jjEwI5ib/O957HIi/
         VhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975824; x=1760580624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8GzvFR6CGlZo09XYMPTCFUeNcSQI8ZtZkJiYSRu+iM=;
        b=l21bYNPXw8Nt6MIXSiLzkDFk5UcxAe9kmTAELls7RNHQ7ds513XiLFt2IEGdzP6hcc
         0S9PuwRWPvZBP5YhnDtsOiz6Xv0wrf9etIaXSrg+jXnC2Q0jhxnNf/Alje2EOr6PqS2+
         I8i1jj8lGVNhQNdlzJF+pVGbsdXuOB3tBxzrGKew8MPtYobZTpcO+DfTfvEwxM5n/HEo
         sSSjnjo9YIbRLkwf0qHKZXrut7KgdMmulFvJndsyYPePlY+g4opJ3BPOvM0wgkMY1bH9
         9khqnITYTuIJu+5c8Zn10Lu4vzkPi4aXEix5jX1yJ5BvuKfyIYe1eiB0SG61gKfqQI1b
         uDFA==
X-Forwarded-Encrypted: i=1; AJvYcCViQhWQxrIuc+qJUUTz9hU/FebYqRXQVrCRMrV3QwSckrScdxmhz9CIC52R0Omx1d+mP6VdnBqSRNj+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd94Tc1A3QNjZho930qGn+rx6YYmqK+EhXDg049OtySC4VUTpG
	buEttvoazoUBiY7y9mopyHYKLPhHpNDh2zfzfFyACmBT1yyJ5B8C1v3Ua3mlxmRQdO9LMqYMXi3
	UOn6ojviwmQobqTZL/WnkXF/ecGR4TnU=
X-Gm-Gg: ASbGnctfHshDp8C21a5YjDm9hhMaCOoRUHUVd/RKT5kK/aCpVqFmLD3xBdaxHmhtx1C
	Sp9opCdjICYFGbxxS/qRBoJye8rNeO/kYUnkFPxCvBquSIbCly6TvYgK/v9MykAAZ7cV2BsC/qf
	/tEiJrHK3G0Hvnin69uJHkEIV5TCIEVwCFExLkRuF99yCkeDJFqMlMnTGKmJxb8N6Y9Mb1b/Ufd
	MPYgcmBClzgaGDSRpgkLSv6zYWXepSilcSP6SIMI0iZmHWBj+iZFXhuZv3xTdxt
X-Google-Smtp-Source: AGHT+IHUyjygXotyw6ah99ayuf0MSKvceh9le+qsaRqcmfDUOI3HEIlsJDYmsBHuydizQMzuabarjvIlam8AoeAXSgw=
X-Received: by 2002:a05:6000:18a6:b0:40f:5eb7:f234 with SMTP id
 ffacd0b85a97d-4266e7cea15mr3454730f8f.5.1759975824081; Wed, 08 Oct 2025
 19:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759875560.git.fthain@linux-m68k.org> <807cfee43bbcb34cdc6452b083ccdc754344d624.1759875560.git.fthain@linux-m68k.org>
In-Reply-To: <807cfee43bbcb34cdc6452b083ccdc754344d624.1759875560.git.fthain@linux-m68k.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 8 Oct 2025 19:10:13 -0700
X-Gm-Features: AS18NWDCubbh5qDnKeyx-bfbRiwy5wk-S7mU0B8RrK8RiyXWwNZsCaohYxj9EfE
Message-ID: <CAADnVQLOQq5m3yN4hqqrx4n1hagY73rV03d7g5Wm9OwVwR_0fA@mail.gmail.com>
Subject: Re: [RFC v3 2/5] bpf: Explicitly align bpf_res_spin_lock
To: Finn Thain <fthain@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	LKML <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 4:50=E2=80=AFPM Finn Thain <fthain@linux-m68k.org> w=
rote:
>
> Align bpf_res_spin_lock to avoid a BUILD_BUG_ON() when the alignment
> changes, as it will do on m68k when, in a subsequent patch, the minimum
> alignment of the atomic_t member of struct rqspinlock gets increased.
> Drop the BUILD_BUG_ON() as it is now redundant.
>
> Cc: Martin KaFai Lau <martin.lau@linux.dev>
> Cc: Eduard Zingerman <eddyz87@gmail.com>
> Cc: Song Liu <song@kernel.org>
> Cc: Yonghong Song <yonghong.song@linux.dev>
> Cc: John Fastabend <john.fastabend@gmail.com>
> Cc: KP Singh <kpsingh@kernel.org>
> Cc: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Hao Luo <haoluo@google.com>
> Cc: Jiri Olsa <jolsa@kernel.org>
> ---
>  include/asm-generic/rqspinlock.h | 2 +-
>  kernel/bpf/rqspinlock.c          | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/include/asm-generic/rqspinlock.h b/include/asm-generic/rqspi=
nlock.h
> index 6d4244d643df..eac2dcd31b83 100644
> --- a/include/asm-generic/rqspinlock.h
> +++ b/include/asm-generic/rqspinlock.h
> @@ -28,7 +28,7 @@ struct rqspinlock {
>   */
>  struct bpf_res_spin_lock {
>         u32 val;
> -};
> +} __aligned(__alignof__(struct rqspinlock));

I don't follow.
In the next patch you do:

typedef struct {
- int counter;
+ int __aligned(sizeof(int)) counter;
} atomic_t;

so it was 4 and still 4 ?
Are you saying 'int' on m68k is not 4 byte aligned by default,
so you have to force 4 byte align?

>  struct qspinlock;
>  #ifdef CONFIG_QUEUED_SPINLOCKS
> diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> index 338305c8852c..a88a0e9749d7 100644
> --- a/kernel/bpf/rqspinlock.c
> +++ b/kernel/bpf/rqspinlock.c
> @@ -671,7 +671,6 @@ __bpf_kfunc int bpf_res_spin_lock(struct bpf_res_spin=
_lock *lock)
>         int ret;
>
>         BUILD_BUG_ON(sizeof(rqspinlock_t) !=3D sizeof(struct bpf_res_spin=
_lock));
> -       BUILD_BUG_ON(__alignof__(rqspinlock_t) !=3D __alignof__(struct bp=
f_res_spin_lock));

Why delete it? Didn't you make them equal in the above hunk?
