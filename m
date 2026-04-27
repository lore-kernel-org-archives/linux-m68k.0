Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5716137F009
	for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 21:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326449; cv=none; b=PyNlAnPeWbXqCP70ikSt+dvvK6SOLZ6hM4V61zLlFTO+PY8DpvgPQr3Dw6VVN62Vgu/MeLVu6j8rrQrG29x/MW9U598IuBj1F1HV17/1ORYSY7Z/nIqXOd8+Bq8vGSVZxp0PksphXGuqcb2B4p0SBEmUn5G49u9aD3TybFbk0iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326449; c=relaxed/simple;
	bh=i/k46YQbNxc6jmDhpSrBTZQploRe2hY24KQV/uGHVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7hkMxZ0w/5GAxZJ+D3Y3DoZg8lv3j5iOmTZZuoBjQG3ud/8Mh1IQCBSih2L8Mv78NsdfXVCZ0bOtFsTMLyunxFVfhtBE2WylwcXhI+QQG/j6Sxe4hXOkyromHJZYMDvsOqKcvInT9SpgYo8U0/nebuBPwmZN6QgDlCP93fbcRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RsHvqbZf; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RsHvqbZf"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so18829168a12.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 14:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326447; x=1777931247; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=RsHvqbZfufZ6jEI1/jKiqrlKFgREqsbR53sAJ1ne0bEAM5g/lW4o86Uf9iqslXlgL8
         sCouSRbvN5Bu983ytM6mhILTOVg9FPcXYQcwaRuHtjLP1f6hvfE0apVo5fvEvbWZpn+E
         6Zwjtxy0xz6IzuyRvvQlNuy4u/en0cC+9SVWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326447; x=1777931247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=GH69EY1xUW7kf4n1AT4/fcWPm8D/cFYfABL1NrRO9TCwhKezUwWr6/fj9o6qQGJ3Ia
         oFWEdDNW/MnTKez8duxPQEp9G8zccBpoWGL5/dg7oanbrZQmAPkiBdbO/Lzt28/m0x3S
         LnGfW6E7q+aGMIh4DB7fkl4MzGYlkczxtCzkLk/KpyhpsbkEWhSZTrUkB9DXe+1TOP4D
         Kw+7KD4W2ZFxf1pn6zK9oW4hPObrUAbrvqQ9RKQ5OeoF8M/auSVs7BZl9dsKrgJMrjOv
         ZEWYcqF017Us2RZekInLNDRHa/2qa0/NFpGdKM/Z4oZVOHdZxeizow8fPzYc9KjQlD6q
         sTfg==
X-Forwarded-Encrypted: i=1; AFNElJ+XApRkV2XP7so5VEzU5sRebr4WMQtLZe5JdpqquwUnzYuDEBsLiWclTrNZ0Y8sXgT5KV+EexRz/ILJ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyaexTENF2vjZLp+JuL0mcXkd0iEqFSuxDa9hZf0QcDNWSg2uBx
	QYsWOhU+Cn8+X/ekVf+pB/nI62AzT7cMD7ILRUxaOBBPeEJ3/2AxKlDc5PARM9Pn9p8poVlnkuj
	dqwztRD9yfw==
X-Gm-Gg: AeBDietHKShPm66YKa5tDxYvF3Lwy1pj8SubDEmYnTrcWMrE+lI9CcTyOlKUrrryOvo
	2BumnSYzLpIM+9VxErrz7dR1s7CVnwHR6OMsDetBC9y6bGZOzMqeYnE8loYsZjFcqfVrqLEFZoh
	VMpqzxCeihN2qHwpE+Ygg9Q7LjiBAJceH0NjFRALDT4q9+tt/9pKZBBWzSYit6tWkH3l2JHmdcU
	oMjvIBH7CJpveFLzWxaDhwKyytLTyjJxYFf8XXTOHY1XlkdfHtgnBJlAG8egvFmneFV6tFXYLbl
	wDg93yL5Z1sSJ0K8UfhOZVX91Z4VROJNRb76he4efwVQWnaz+TajRy/HkHoQPUua/xGD/bwq/n4
	5zEjbev6jexTfqxj9fkiQ/qDHpC3LyHiU5uAOK3KO5fqp5ZtqQVyQlk5DEn2qn4ogdE7IU6NW26
	VLV32S3xi9/99q/Tr+f0Y0Y8tvw0qVrhB6sXC8bca4QfJ5VktgGjSqfEMJi5T9C4AcTRziDRzPx
	Zew5Kpo3J/s9+NvayOiCw==
X-Received: by 2002:a05:6402:381a:b0:66a:8002:fe17 with SMTP id 4fb4d7f45d1cf-679bb08f337mr149245a12.13.1777326446520;
        Mon, 27 Apr 2026 14:47:26 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67d5eb1sm141371a12.10.2026.04.27.14.47.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:47:26 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9c01854477so696838666b.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 14:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ol1OB6OdEz9uHK1BxF3g1MX5jiT0e7Pj77VRuqDLa65lxoOzyxIyO9LCqN8v2xWicqpNw4aWLhNnD@lists.linux-m68k.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus
