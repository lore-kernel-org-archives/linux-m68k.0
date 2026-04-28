Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187483B9DAE
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369202; cv=none; b=RihJbvajWELx4MXkhnBcm9xuuZf8MXWNYGhekenoM8DTa9YHG7+NUCxXuSQFh7aQeG0gSCLZohJUqo3+EMsRO78zfov8gqpiQIdyKJ+pmRTx4SFfvzKGPOAFd91lgAQF7T8rHJgPVR9zj/Xz9uaGVnpmLtwJRkp2Evo7+6J+f/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369202; c=relaxed/simple;
	bh=a8mF3Jvkb6RjDZM0P9AxS67wS1aU5+HJqF17cB1Oy5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0xJpnRuPpVAux19o9kMhJB6qCt7mjG9Ugu6YOvMXA3ThvhPcsNV4i8swODZCZfLlopwUSydC+bBgsLnYpQ59pVJhfV0zMHNfhGvIGBVwz553OkycmzKDFs6lmD+KVV1UTDXKfstRO1YPH1/SA6lBFxD1dxf1z+C2q+LNIKjCno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dSB5QitU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dSB5QitU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777369200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgqD2LjcS3lfaRz0Bbuyp5agpi0erzgXbo3a6MpALAQ=;
	b=dSB5QitU6Wk9xlj6KkNxkAHXjerOCx+S3wy/zvTWAnl25KiunrUqpDi8gwdodQRjC1mR9R
	s/NEIbTuU4oEeG7auQ4qsMGUYIfEg36UHGPU700zFP/GexIaJ+S3+c1Eld9YSUFGffLktZ
	IuxGtM5ifwrrCSwM86WDw3CQDFmciws=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-ukWHhRNDOE6vn9LxSquXww-1; Tue, 28 Apr 2026 05:39:58 -0400
X-MC-Unique: ukWHhRNDOE6vn9LxSquXww-1
X-Mimecast-MFC-AGG-ID: ukWHhRNDOE6vn9LxSquXww_1777369197
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-446fea175c4so182881f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 02:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369197; x=1777973997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SgqD2LjcS3lfaRz0Bbuyp5agpi0erzgXbo3a6MpALAQ=;
        b=ZlqdoFICmhlevWnynvQVc/0ssagvBLC819r6dHlsBOINy/bn/9gSKQnA9YB8lJ02Ji
         6W19BNiIG9mmC+XFUV8oT6HwCjEAra0j3H7Me5wSH3vOgOKocHZtkH3dU7MmmMF1DR2w
         ohEpm6X3imdFuFruNmJgrI/+ckqmYlDx0Flii0DHgIleDzzAFumcSWYE2V+0D3nZbAyC
         lYg3nqv9pQOgBhvl8NE2aKGPMzA8OlRHLRQPtfk9uBj7UO0Er9+2tbYO/tBe7EEgOkC/
         thz5n3PxZ6io14V95Bvcj5bVuKFXOJ1owYV+++i2QLcDl3DnulUweXT09KIXy8himVxq
         Kn3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+SeEXaNSw2Jb1JCh9GexPxJncdI97CUcbSJMDDRd1hxdawDkxJkUXX4HwVSiAncz64WTiJKtGu5it9@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxgPqEKvBNYD/LDa5eb0iBBIdCmEUaS7rR7OTrIsXYCYI4OrAhy
	hxCyMNDsrE/6fUJdVDi0PvheVH/M4er+o8io5Wb6TgcdO5iW7hWxHrgm7BCZw2mleHBREe4KzB/
	aZ7QUTfykYEouK1o2W6zsATGwijNuKdFav6tRXeBYebG0GXphBcgGK/nOGh/aXSq49ub3yIYvqU
	mAOczdUhJM1y5VeCDNA0tzX3vcH4mNiLvu9xMGoINLHRr5
X-Gm-Gg: AeBDiet1i4SUck2hwy1ohIxrc828tgoYKBNQhpj6wTAfREDqntq3I3NHfzhHqvrlqEB
	a3upwIfJh8R8K+yC9f6/GbFLG8uFawlnqyfGTLUa8zNry5RZ31WwfuUZCOgm7DsRy2inCuO9ppK
	F1dX1mrVNWnBRich/lTq2Ft2RBZQLCbESlqNGnbUpvK1PDBDUv9LcTerhCdBrvKjDPv5lsO3X2u
	u+quXhFp7yCyTj7wGq3oF4mLatU19e9e3N0MBkmw+nQzamqQ9OrmxEii3pZ3mwaQwmfhIAymDrH
	57nQ++lvd8heq9Mt
X-Received: by 2002:a05:6000:184a:b0:43d:7946:badc with SMTP id ffacd0b85a97d-446496d5208mr4451824f8f.26.1777369197238;
        Tue, 28 Apr 2026 02:39:57 -0700 (PDT)
X-Received: by 2002:a05:6000:184a:b0:43d:7946:badc with SMTP id
 ffacd0b85a97d-446496d5208mr4451757f8f.26.1777369196742; Tue, 28 Apr 2026
 02:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427105810.23761-1-pbonzini@redhat.com> <CAMuHMdUvehWeTwdN1czjvv7OjGsu_XaaYS1R6Tg557mDqP+fSg@mail.gmail.com>
In-Reply-To: <CAMuHMdUvehWeTwdN1czjvv7OjGsu_XaaYS1R6Tg557mDqP+fSg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 28 Apr 2026 11:39:44 +0200
X-Gm-Features: AVHnY4InOLQxxAYojPY9TCY0WEKwcodWBYhqlVS7vN1v5Z6dVPP34NbhnYWlh34
Message-ID: <CABgObfa+2ERN1TmVeeWxCQKzra_OThkgkVkBGgDfu5yOsjOH1A@mail.gmail.com>
Subject: Re: [PATCH] mm_types: remove references to s390 gmap
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-m68k@lists.linux-m68k.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zTxUgB0_RaMSfjQvwz7OPczs6Lj0Ypvm0k0M3Zl81iA_1777369197
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 8:58=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Mon, 27 Apr 2026 at 12:58, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > s390 does not anymore use special struct page for its shadow page table=
s.
> > The honor of giving a special meaning to pt_index is now m68k's, so
> > rename the fields and adjust them for the desired type.
> >
> > Cc: linux-mm@kvack.org
> > Cc: linux-m68k@lists.linux-m68k.org
> > Cc: David Hildenbrand (Arm) <david@kernel.org>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> >  arch/m68k/mm/motorola.c  |  2 +-
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Thanks, do you expect it to go through the mm tree or are you taking
it yourself?

Paolo

