Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353520;
	b=q0zkkB8AWkv4RUxeBSitUWnD/I9twtpWOCij4tniDuzspHQBuqE9xuQ5KxgXV1KH/o66
	 IDrNiuxKGPQlWn0ppdTiS7O5KB3m4th1lVfKg/hTQNn2/IJIQoMM7mEj6x74jAdC5vk0e
	 XNAWtvrkccnWfQXhOB1ltTiNaydV2A9YPBX9gxOvgfUQJ89XjJBpjnara81pA6ed70j8z
	 h/hsoRZ3I7h1ubvKzD4I/epInhxxg9KUZ7cu4tAKPj9Q/Zqt4Q+pKZfnylM6QZ4LgLNGA
	 aG2cWkdqcF7lsJSwUa1A7bYyiQl50ONo0NoQLmypP8Z+1/srDpiVi8hLwLINo+JjapQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353520;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=q8Bp4lvQqYUsZT0k0dArzQOZC6e3m0dIfgAJwvcDsr4=;
	b=JTIH3u97b7/6ryhG9sn/geNC9H/yNAKgA4hRCerEPoXFpw548Epx8MhCzgZVz68D1kKb
	 f7+2SQYa6r/QxHRy4inZspnHkwAC2LIw0ePJDpO3p1V/NosBDLvFh+6pnD7L82bvZrsY3
	 GaqddS+fP+y9XJxskxM8W0NshGN7tQ6iNubIUhOtjhTSJyp150s2L4TCNFuk70IFFFjyI
	 4W4gEYEofh45+60hXtjrKdPLMpyoU38M4VV8oaJ/wgltlLcPiUTv8Rlyy7hIDAy0uaZ9G
	 klVTTH/sp0i7eOGlbsTNhBLrurLg/+58O7AXgpRj9jj/squGsxHb7YcehKqqd/cRmUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B2606A32A
	for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 09:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 079B2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-705cb6cedd5so1144587eaf.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 02:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353519; x=1793958319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q8Bp4lvQqYUsZT0k0dArzQOZC6e3m0dIfgAJwvcDsr4=;
        b=fFeY5LCE8vebyPRF78b1KadHI5W8NUMYUvYD007jBynbJW0+zu+Vw6HHOynWYaH5uO
         AQ/wD/VLLn48kHDx9J+8f+HYNWbUQ6xHM6HlOB0wAZX2ZmtzgbZT0LUHQ28lokOD3eZI
         dkkGjcy7c03FdjZoQUomYo58gXLoA6nrD6c5+x/LjAn16NXM4BWn62wVUVNm6yexsexm
         B0lFa8Q9au7lnGvXBWzZy4qIVXtMuBTbz2uvdV1ubO3SyGasJ9Kfi7AVCyWx2lAtPrxV
         ZJEBZshPX/yej5v44lRFgDIT05FJRu3nPIgBYbGAcxRSNASatcLLpZsYHI4qlhfPEEet
         aotg==
X-Forwarded-Encrypted: i=1; AKwUvByL0dBZ7gq9FmfY36SMpaAmxIx8V8MCGbh8Ilm/E5Syk5y0QVaiWSMQk0kXY+r6+0tjkmvq0Z39tp/n@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYKorG7zz+KOIB7BEB2dpV4TtFUVvgABsHdIsnan/VD1Wq+BtdL6
	mb+7Kn0RmCHQdPhmBE9Dqb0glsAqCoVSYp6XMp0NNUTsSK/SusEwh5f80z+VTYB/
X-Gm-Gg: AYBFou0EqtmM0Ztxx1BDZIByamzz/z//tp0ea2u/FrLaUJkgFNXyED38ydWFgteXz0o
	0OrDcVyYF+fdMooHrdiL8Q/+4MUHXQQpsP87e7oPtPRNged9mgdgA0wJuvDDqiNk0twsV2xvY59
	khWYp+tKwV9Jevkmg8UCzd6zKqpHtduq98Ih8wYhib2Row2M0lk7tNESNpX7a1AZ7RnXVwE/mNz
	+ke88u3cEslDYYaDggO63vz0uweqMp773eD39GvSRzz1CTpuQj09nY5LNXWSUNZUJHlfwRinSTw
	n18sTOI7Sbtiu+CqORFpbS0qqgu+JqUvULawH5o3G0s3OZxifWsIiPXdqN42XPISdqvOSDTyAay
	mIv4ZGzNxJuc4iMcxEm6p46sZT8BOONz2wQ2VJW1PuDq/VsNNOSdRYDV4FoKIREhQHGo2RrBS1E
	g5ScsvIcSFV74oZwpxAIu3t71q+HZiVA1gSETlhRllCsJLc5zgFROmulrztupGEtlTGC0X1IIBy
	VV3jEOl7Nq08niIbAYjj5EvVTu3uCyMn/eXBXIMPPBPiLjZl+efjYrxIW3xGK9Rbql3mQi9At+6
	ltTAd6VuLwz0Rd8+jXYXqYb+bM7brxu3HQziWosc08G+D8eO5uMl6f3S6fH/3IEzgTA=
X-Received: by 2002:a05:6820:151b:b0:713:df7e:1016 with SMTP id 006d021491bc7-714ddecbeadmr2910653eaf.11.1793353518699;
        Fri, 30 Oct 2026 02:45:18 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com. [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a90ae4e9absm1442290fac.4.2026.10.30.02.45.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:45:18 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so1418489fac.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 02:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxFv9zlJYKVCcyLVSblQxLKjYM6QDR/KWOJrD2dnc0eg0oHRm3ZOHTP0R04i+GreEUQ1L0APF85Pm3h@lists.linux-m68k.org
X-Received: by 2002:a05:6102:605a:b0:7ca:8f2d:5c29 with SMTP id
 ada2fe7eead31-7d0542ccab3mr1591386137.27.1793353163338; Fri, 30 Oct 2026
 02:39:23 -0700 (PDT)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083800.599152-1-songmuchun@bytedance.com> <20261030083800.599152-2-songmuchun@bytedance.com>
In-Reply-To: <20261030083800.599152-2-songmuchun@bytedance.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 10:39:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjr+-4GA=jBNpL3nig6QfQ0Fm8ob+c-OkLADPUJSaNqw@mail.gmail.com>
X-Gm-Features: AclHuK-5feC2ixWlfC3xXKJ1XowEcUrdLUZ-UGAaez_2WzCy_48TVc-7hVrg-7U
Message-ID: <CAMuHMdVjr+-4GA=jBNpL3nig6QfQ0Fm8ob+c-OkLADPUJSaNqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: remove pagetable_dtor_free()
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Alistair Popple <apopple@nvidia.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 09:38, Muchun Song <songmuchun@bytedance.com> wrote:
> pagetable_free() now runs pagetable_dtor() for pages that have gone
> through a page-table constructor, so pagetable_dtor_free() no longer
> provides distinct behavior.
>
> Use pagetable_free() directly at the remaining call sites and remove
> the redundant helper. This keeps the decision to run the destructor in
> the common free path.
>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  arch/m68k/include/asm/mcf_pgalloc.h |  4 ++--
>  arch/m68k/mm/motorola.c             |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
