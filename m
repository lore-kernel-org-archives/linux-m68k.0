Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548922D73A1
	for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Apr 2026 07:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841324; cv=none; b=j6vsPQk0wb9uOdAbKjwsUqCuO+MwZbqWF+Gf58bFMzaPDdunTo8VNVJrE88sFYpdKlR3SvUwfLJsIcngTSQm/RTnqP6TwdYZI1gEYPIL1l1adeVBE+0jsWWKLOZnrsYvNeRvKyEIeAlqHSq1KaM/9Mpzzw9GyFPd/xrRBPTFrx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841324; c=relaxed/simple;
	bh=M5g0U17jf72qYxMz8kLVwYzsVn+6qWRz8++xq+cwags=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hccMuQZuax62vmf34KUB2CxNEHGEEDpMSX3+Ma+zsZyPM9z1PSgIkBwiOfwvtwc7PzWp021N33ox8ijXcas3v00bMOU1U7k7JAjE5wGRlYZp/VGvrKtDEmy33PukDopHUGs4H9ygtp1L3J4knzRXPWEUf0Lt2RZIs92MZ8djziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a9076813bso2101404e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Apr 2026 00:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841322; x=1777446122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyxMyDKhrlWE+5iCHg59pMAULgdQUBAeBRtLLkE5UPM=;
        b=TNVb3s2KQ27JkQo2eYQ3xPgIEOyv6J0Dec7XIb4ruNi6XsENYnamdHHSZ4IC62Mih1
         gcgNBhIUlTLWBy0e89Fd3LMKgtXV1JGQAVaRe3PfGCzW3YiJyvonchM5RYoJir4aXPXU
         AX9Ef7KXuAPcSlATwJX1/+Em6ZBEhMrdspTwygeI0XKQKUzmJ0LqwUN6SWqxLQlQECGI
         4GmnI7FqhThgMHBfEisAdiIQtK/K/y4gVMWNyo9FrYOx6ODp7kHwd3/F6mIsbBrzKzl6
         80Iwsgct42uSSgRkCeteXUEzTjWi3AC0ae5fTjwIiRFNoZoPIhpHRTPtfN0tBbZXEdoG
         GDeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VPhrxjtaCX9n3hl1utGsVMvOkmD0akpFxubz9vejsjHvAl8i0Aq4dIdX0glyIqBL1mJkbRKLw/Eb6@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwWcRdDwZ85Qk7Uwm3TUipAiGlcm1UP+sp+HOTQsjH6zienHNlc
	ANxCUfSUz5z2gVXIG0o/WmJfbaF5hfEmVYSSmDhmw6/yARoB6zUyv0xbbzYHmbn/2D4=
X-Gm-Gg: AeBDieshn5w7Su2MFCRy+iCqUDwWO45FGEBUPYkwWa7WYvgKHxoGPdHi7M85er+w12l
	MpYhIQcuwzIOH7bt3rRWYQihojEwtC04ZblanwR4kdU0pFMT5hM39LHvy4E3by/Ao2Krt7jtkAd
	d2+f1RtQhggFnuvj1zZ9FNRwHZeRMz5sNWdidGKF6S7OyR9I/Z3jMc17gfEQroJgDx/sL/43+54
	RYk3fgsFhdqa2DPxQgVcss2FdwAMmYSnn3D5OG81uXfbTwpoIxZMc2+cBJDDUVw619fz8hhaZG9
	xixV9LnjWxadVpC3x7LuFBaV1A+2MhBXGNX7p8+NtsQGOhYGfIWYqgn3jGaUFrJEb/oAw2x/XJv
	uWlqX43ABeeJ3A6+2vAPAwwQ0byCV9+dl9tcVouvB/tni8lewiR4Cj8aOkLugasBDKkdtqkljHy
	M6RtsuFsgkhbNIdxt+GrwvUDaH2OBirsQa33e/8RvlO0uU87uQpMKYIICAAkWo9gDtO7LPJvg7m
	eE=
X-Received: by 2002:a05:6122:4696:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-56fa583840emr6336879e0c.6.1776841284577;
        Wed, 22 Apr 2026 00:01:24 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae9dbe7sm123254126d6.43.2026.04.22.00.01.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:01:24 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-506251815a3so43173101cf.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Apr 2026 00:01:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Z0CBHGWP6NpwjMgiuW/CDJ/DlvX+4MyzR9dcNjUgWlvBd/psQxCpGstl3YCPbxBmJcqMrPalGiUEh@lists.linux-m68k.org
X-Received: by 2002:a05:6122:f84:b0:56c:db8b:504e with SMTP id
 71dfb90a1353d-56fa59fbc9fmr11532873e0c.13.1776840884876; Tue, 21 Apr 2026
 23:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776808209.git.mst@redhat.com> <006f9142e591ba8c340c3b354aee76aec5c285b9.1776808210.git.mst@redhat.com>
In-Reply-To: <006f9142e591ba8c340c3b354aee76aec5c285b9.1776808210.git.mst@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 08:54:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtNPY1=92H8GZSDkQ5_rNnxL6WkjTF=1ApjwTA4z1TqA@mail.gmail.com>
X-Gm-Features: AQROBzCgl_wyqpfJ8JAvw4YHU8svwkzmMCs8RMYgDiGFQgsN4z72BoUKVxkZaoc
Message-ID: <CAMuHMdUtNPY1=92H8GZSDkQ5_rNnxL6WkjTF=1ApjwTA4z1TqA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 10/19] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Brendan Jackman <jackmanb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jason Wang <jasowang@redhat.com>, 
	Andrea Arcangeli <aarcange@redhat.com>, Gregory Price <gourry@gourry.net>, linux-mm@kvack.org, 
	virtualization@lists.linux.dev, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 00:01, Michael S. Tsirkin <mst@redhat.com> wrote:
> Now that the generic vma_alloc_zeroed_movable_folio() uses
> __GFP_ZERO, the arch-specific macros on alpha, m68k, s390, and
> x86 that did the same thing are redundant.  Remove them.
>
> arm64 is not affected: it has a real function override that
> handles MTE tag zeroing, not just __GFP_ZERO.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

>  arch/m68k/include/asm/page_no.h | 3 ---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
