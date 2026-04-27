Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC543ACF04
	for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777313256; cv=none; b=fUbse5lSZl7f4enHhaYcVOIf6U5YbbPblKLVdcCoDFWcyoSsPpta4hDsBeywW0CzgKQkqJlU1KvrbwCx+ONURDmTSPboMo+ciVNIUE9rkLFAoJKp18zjZ3S7E6wUFWGM92TMWelGJFKZ1GM3NaBhaoUjVpnSptB/ifhvbpgmt+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777313256; c=relaxed/simple;
	bh=LJB/6F8gRS18jiwpo8qTgtmT08hQ2iYqeOWrm4IbRjM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mmujwuGCUeSv+RGrEimQL9GapU1Ma9rrGeqrw7j+oloEKVWUOx8CAy8oBZcoWTJna+Cwxz+gsUz/uVsdUbhFR+rD4V3tmpkJ+gcl2qKFYcVUOIUky+bRX/LXuIngAWjEG450X50dQR3uxmyj2EvAuO0FAZtkrG5dTpCjPiDG/q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sQyq/Ny0; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sQyq/Ny0"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43d780757eeso6990927f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777313250; x=1777918050; darn=lists.linux-m68k.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=;
        b=sQyq/Ny0z1Q4DZlAdEbILRwVwmpe8SgHcXvWgrkC+PP2FvJwhpZa/i8sF5vIUQ+DKZ
         9O3YySCnSM6b66AQpi+ztRvdZXZ7e288bZOjuqHC86i0vQdN/833zgUaqRLF96BHXnuk
         T1ZbLNHi2RORWMvku5q2T2euwXCIPRHgLtN4vRX4RX/VVzNVaBYzAlIxrVh9iCtmFMC5
         k2fzEZwjN3gTXFJVE1SMoUfbcTdW0geq3bNBLfmjY8JrMDhshs100waViqeUMVrSqGWH
         YLr7zpChi08seR/6R9YxP1SNxPmWb5HK4guEtvs2Nsmb2kqsUs8MNPhR1M9I99xcM0js
         gCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313250; x=1777918050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=;
        b=saqhCfpoC3OD4wKohvx/As8YX5ysLCW8o5zACs+0KWdF494SCQrkSbwhkJxuU0ENLK
         BAAlLkTuIKp75wzwya6jWbsoRUs88qdI12beQCbQS1EEia5PgjcbPk2z4K2uAHeeZbBx
         Ort20gUZ1hYtUxLZQ//Wg5UA8vhjc0Uh+4lfC/gr7e6Jjh4fPspSTJ0fDemE1qlCpEZh
         jYvQWzQVjArQYMd3MAoCDYf9Jg+KBA1gZrydb2hie9OhhDyrpnqtpDSkeP2cK0hs77F+
         BOYmp5C/D0OgGb5ZDKr+aDpCHNA2ENBHmzySmHph1sDvvuTTMfPYd14Tv9wPd0nLZMKc
         OgUw==
X-Forwarded-Encrypted: i=1; AFNElJ8E6gsYujT8hUfyPaIENiTYsXJBTSvkc0r9bAmg5Xu3xw6FNIuG0YG99Pwraix5KidVn8RlocRxcAjm@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwK2kHIoSdbaaQktyNMMFKpCjxVPuSZ9gz1ApU6JQPEyFCxHB0l
	tOq8sE8Y2ThVzNsMv5Mx5Wbl9YSf1tKnyXdEUlUeb76j3XN+TaCvWsAr6qr8MxyEUg8GRgQxE7P
	M3TZKIk1KIs9q7VYaAg==
X-Received: from wrmd3.prod.google.com ([2002:adf:e883:0:b0:43d:7940:a11b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41c7:b0:43d:799c:b2cb with SMTP id ffacd0b85a97d-44636a393e7mr256856f8f.24.1777313249648;
 Mon, 27 Apr 2026 11:07:29 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:07:28 +0000
In-Reply-To: <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
Message-ID: <ae-l4FGDPLwBuDXM@google.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
From: Alice Ryhl <aliceryhl@google.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 27, 2026 at 07:13:46PM +0200, Christophe Leroy (CS GROUP) wrote:
> diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
> index 01de4fbbcc84..710e07cd60ae 100644
> --- a/rust/helpers/uaccess.c
> +++ b/rust/helpers/uaccess.c
> @@ -5,13 +5,13 @@
>  __rust_helper unsigned long
>  rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
>  {
> -	return copy_from_user(to, from, n);
> +	return copy_from_user_partial(to, from, n);
>  }
>  
>  __rust_helper unsigned long
>  rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> -	return copy_to_user(to, from, n);
> +	return copy_to_user_partial(to, from, n);
>  }

No Rust code uses the return value for anything other than comparing it
with zero, so you can keep these as copy_[from|to]_user() without
issues.

Thanks, Alice
