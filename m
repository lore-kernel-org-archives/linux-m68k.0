Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368087;
	b=KwBszMk/VJaeX601cTeSPrfmlRtW88fPKaNWYcx/CnXEOGJL7ZJscyeNPK/eUFIfefko
	 C9NsyKoYAuhhD+YW3VXvLPXNjtgvYKvxyhdljs6a6RR1aF8s2AeZsv5hD/DHriqffnU2p
	 8+vkRn8QDaXW3b5F1QAtUJjk6B5KIA/RNaAw4rAtYgOJgXjmKojdeubIm8RVJN7e2QVIw
	 fytoY/nV/FbSL4yi5OMojgBcX+VkHdzQtsOkyw8e8WKnpUQzwzpUWKLy/jihfea5BihFn
	 jHgp1WpDi5zBfPfR0l1a3cpPhwPzV9Evei/8nD9qBiLBd/r7191jhwlYDoZ+XSYoiuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rmX4JEwV7qAmy43PkgvX967p02rESGhBBxr09gc4cBg=;
	b=VT2aEl7fTel+p5Bn7pNCHgmd9oFX8R+KKX/cPJQa2sGMZ/0O2y/zbHyDK8AXxaumd+R3
	 D0bjPrk3EGTPnKUDElXvSzotOeG+/Ukd2s9vj/y2eCIFFYCukk6E3fg5WWmQAhCBlclzV
	 u4GdSmbZlBNfrTuTmYBntgxkDaxklhMNgZi7ihoCrwlP+cvAF4vr6S2AUUVWrErnkNKb8
	 EGo2JDRB3Qi7tpC52RqmtGKBmvjN8S1RDe830qYwMqD1T0jEYOAkpLWynsIL72x4JPHFo
	 Vcr22Xu5fUdtfMws1Btboa/SOYuQ7n3Cx4jSx3XKq1D0HMLxz2pnokTIfgPmM+t8kaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kUgRhZ6G;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E74606A321
	for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 13:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07E74606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kUgRhZ6G
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso6734355e9.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 06:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368085; x=1793972885; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rmX4JEwV7qAmy43PkgvX967p02rESGhBBxr09gc4cBg=;
        b=kUgRhZ6Gk4DxgjPmIFksSUezOnRXG6LshOdNRKCivhHXbVbz6Tff1uSvO0PdTTOZmm
         mzTSAyP1p6v7fmnQ+g7tSyZAGlpxHEzrTFqY+M0DiXjhlGDAHQ7+bc4t+r2N6nxk/pWo
         +l9R3KqxY2sk9Bx2Rc6+fPLvVTo8EfzL1c3XYBEhNyvjHWXwxFtogwpxue+ditFTOqXm
         t5+py8xSpIkfnFuBfsCdPnZbgXurSw6K8mNb9OsaQ1EN9mhmDxnVnCI0sJs1phl7+dc5
         0R+NMB9d2MrDjnMPw39AidBaEYo/rKlXUOD3UK/i1FxxNWt3waWCSvQ/2WBI+GDT02Jx
         uUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368085; x=1793972885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmX4JEwV7qAmy43PkgvX967p02rESGhBBxr09gc4cBg=;
        b=A0qHi1trKVwaA8Fmqo8x2K5MoeJb1Uki3/HWCiD/yn+9kfpe07mPqYaBVlyTCiX7Y0
         dc3r30Oq9bGYoxC7hLGg55UCr3kViQdDZBmIybV1b0CZIURVVhm7GKqNm5kFbeWPDAl4
         7uv3iLn5vT5DjTikh9ELC6NQ8/ZSlALziFw94ndgFTadDPsMBo17/7mG7BxK17DuEBfi
         BZ4ehT5HNSRXWLW2W5jRW3Is7nO6wthbwr+hjLCFypjc0U5bGMqQj2t9Dp6Zcj0RY2Ay
         vJVHXjK4o3UpnEMKhuMc7X7qYyjVKDmXfbGF8YHEzhsuX5RifR49aAvFuohc4jR9Hd8l
         yG7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPfQjLTQCPJl2iwIkXtvbPg2JMC5k7OmIEvcqhwhAhjnofFxOivZvbUesFUSevz0gVMf+t2fn3+Xw6@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYJBjx8qEDb1NAIoCf8jQJ0GMhy5nDoTA56PoaA4OoToPV5VT6pL
	3gX/t80od4TEJT4qoXbXMVcMQSjjQUtQv9XpLzoo7ydsdJkvICVk2pfy
X-Gm-Gg: AYBFou3Ik96DpWXMrOoeiArN21Olr9JPNlgti0acNZi3aF4Gz7mhG+54cwx3nOi4m7f
	keyeCrJq7/j5X0qcNrU0SC6/Uk9WKoy6AWVuwRR9nt5ipO4LqNyd7Sj0a+v1VBIIbPhKYBrHbrl
	/cTHGKHgsJLs9HDEotNXY7Fx3kW0tpN2dhJBkI/8FrQmHQwkqHyuLITKyYrvndKkWajxOOw+jc8
	2AKFXr8T3dIGZYF8eJ90pZ7gjKMepg40nGskOtIZGBo3ijt3SNiTB8RMWMznki+ImZOS58K5iKC
	0BJbH4PmD7f6I8Odr0h4/J+DRgCzyHBBg5lIQbTN2LXXYOiBatwAadOtxM9Jp/mvoOjQkYoT66q
	17hFgrdQ5yEqBp5oRciaCtDKP03I6gYTL242e1O5pk/eqfzNRlp47mKnwQaxMZsX1tlNmZWyB9e
	/n3kh2x5cPM1DF61fYmyf0I/VsJP9tJxTCl4sFSyrH/3LZmZW+NgoK7EL8suZHxjI/MXaWkqxU7
	p39KVcFl4QcbgUbwAAMQJxdMzEbX/ah188Yq9rOFK8DYwvKG0pO9CplhsW2b5h2PjBBXSrJmvNb
	lQJHDU0iRWKKQY78jmrUZ6I1GD9e6xCN3r8AF+ml2kxLG1C2EHhP2+aaH5O0U/v8Zojqk3mLF8/
	w6fST8SG3wVyH9g==
X-Received: by 2002:a05:600c:34d1:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4ac1793fb5emr50752935e9.15.1793368085145;
        Fri, 30 Oct 2026 06:48:05 -0700 (PDT)
Received: from C422HJQPQG-Fractile ([130.43.154.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm172048905e9.15.2026.10.30.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:48:04 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:48:02 +0000
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Alistair Popple <apopple@nvidia.com>, Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH 0/2] mm: Remove pagetable_dtor_free()
Message-ID: <auSgElFWW4n3sJLb@C422HJQPQG-Fractile>
References: <20261030083800.599152-1-songmuchun@bytedance.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030083800.599152-1-songmuchun@bytedance.com>

On Fri, Oct 30, 2026 at 04:37:58PM +0800, Muchun Song wrote:
> This is a follow-up cleanup to the page-table teardown fixes [1].
> 
> pagetable_free() now invokes pagetable_dtor() for constructed page tables.
> This makes pagetable_dtor_free() redundant and leaves explicit destructor
> calls immediately before pagetable_free() duplicating lifecycle handling.
> 
> Remove pagetable_dtor_free() and convert its callers to pagetable_free(),
> then remove the remaining redundant pagetable_dtor() calls. This keeps the
> destructor decision in the common free path. No functional change is
> intended.
> 
> [1] https://lore.kernel.org/r/20261023063428.3658761-1-songmuchun@bytedance.com
> 
> Muchun Song (2):
>   mm: remove pagetable_dtor_free()
>   mm: remove redundant pagetable_dtor() calls

For the series:

Acked-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
