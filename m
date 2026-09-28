Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D183ACF1F
	for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Sep 2026 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597759; cv=none; b=mXXJVSakkvTmTVdX8ZcCbW7GiR6VNfCXzNwPMSSOTKDvyN58F4pAOmTOmKB/v4Xmk48vrBH41R+pnLdcAI8c7yGvo5ruFSEnwuabQEXAeunhfXaOPuw/uHDdcNIEjTO42ZKTJbafgAdSYepa3G5FYKBIWSTI9Ed6o+IqKbWoKgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597759; c=relaxed/simple;
	bh=ymWANid+W9QAIfsP2B7dxOZPLHb025E1MmiiKZKG/Ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1ow6y5iCgIXldmYQdQIqnvAjmxTpNdY9yL7zDxAzlbc1OG21RdOxGJbNXOxppbLrHE8kcpTAJNVp5xMpg30RyIJ4VXdSeGLlGslc6qrkgRjJ7rAteRKcOqWPUFE/GGjRWZaEdSAA6OJx5Z8BTCbX38Id0WZHUojlMxY3YZgxQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b42f1cbcf3so947998137.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Sep 2026 05:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597756; x=1791202556;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XQP52bKkr7Y/wzuKqDsjuqgLw7VrjDizWZT0Wc7gkw4=;
        b=rZUgry17MyL2FS72vVeq6oAzDSEEPcfipJzdc5tf9amPfD1kCkc0Eh21k4ip7eYvJq
         l5nxkmZF6DAaeLZFJU44QrrV2iucgILgvpOpM1+qdNhpZGhNdUVTFVCmTTB1eTy/fvLd
         lpj1gz0NaNPracyrE93dflg/Q8c5FJgx8EDSxXtrsUPuetyGov8keAatf7hHCJABv9rc
         +pgjIHbuE9Ftuy+I92it6iHni+kSIEDEG3gOhwWA8hynLP3zwxDkOsiDyUn5gauhaTUF
         31G/9C5uaIVPGwJ7I0Os5MEpt7uy3nEGvCYJCdD5kE3NUfta668V+NFv7d+M1knmUk/b
         VgVw==
X-Forwarded-Encrypted: i=1; AKwUvBxDl5CP6iOXtWV7MINMFs488MxbCG8Mu+8T2tULj0VQrOcBW26m2PqPELhC14ERsSQZ8ajgm6TquVmm@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYKitF7BWZS0wUjafoTlnOb2FEWFuYcQ8NSfdj9n6unYVj/citTi
	Aq9plspyjbtu1Ah8Mi45BjQ2pnSKfvHxQaM6itkSuShnOTW7HrRme6NHMkFmXY8I
X-Gm-Gg: AYBFou1kcC6PBlG42eQPyHWmFFh7IoUa/aYESkqZ4KlrN6OGAYq5zvtYzElOG8oQ9G5
	5q4rC27BumpgfR/qUgHp6Fun5/c19XXFVhILkb14LJElHVQO52McGaRfKcIlJGvn+/I1WwJwoaK
	tLAbg0wjrVB8ivNGnkwTNWeDcQnlQqt/wdWTVY+tkJa0fRc6q68rABihQQj6qIzPckd2p+UBD+D
	Tm3JGowEj94n5dDewtxGMuIlY6zJn7oCUm6oNpnBdK0LMHqFFYX8VJSy/lxE3xM9DakZy1ntukb
	S1yok3P16/AZkkQYujnvvXfTcU+uWtwwl4Ed3DXzAFowWEXedyZ9Q6pXKT2fmz3LHUlT6k4wlqq
	7NseowVqzK6Euxg20IHglvZHZqGSjKoVpwvPzdQfAhtdZEOzjnj0s8oKLangote7IT/r6p7aUBk
	WWago6kyXDUcuTU0NfubDawqh3QMHUeoYtTJhfm7Ugla8lrmDoiWEhcvW4KWPUAwqHVTXgKNWTm
	/aQHg9vJ+s8pNrvLY/GVX9vL7I3P3sti0KX
X-Received: by 2002:a05:6102:20ca:b0:7b3:d6e0:d1d2 with SMTP id ada2fe7eead31-7b3d6e0d79amr1120281137.28.1790597756057;
        Mon, 28 Sep 2026 05:15:56 -0700 (PDT)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com. [74.125.227.38])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9af306sm9018914137.9.2026.09.28.05.15.55
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:15:55 -0700 (PDT)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b2eb9b9809so1414430137.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Sep 2026 05:15:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzCHKmAqvJXvqsPxp6PnhhNUjSnDNSslGo3WxhbdeKJWtmLPEHmLdUfAnh3mtePtvHSTYL4mAYAQOdw@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6883:b0:7a7:19aa:8a83 with SMTP id
 ada2fe7eead31-7af1ecf279bmr5070898137.30.1790597755270; Mon, 28 Sep 2026
 05:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927205501.672807-1-visitorckw@gmail.com>
In-Reply-To: <20260927205501.672807-1-visitorckw@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 14:15:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>
X-Gm-Features: AclHuK85gzWq5IklKOwAQu80W0kMa7pFyTsMwsvdeVooaKjfbbGjxmEBQYgiP_k
Message-ID: <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>
Subject: Re: [PATCH v6] m68k, bpf: Add initial BPF JIT compiler support
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, ast@kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com, andrii@kernel.org, 
	gerg@linux-m68k.org, rdunlap@infradead.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, marscheng@google.com, 
	eleanor15x@gmail.com, Daniel Palmer <daniel@thingy.jp>
Content-Type: text/plain; charset="UTF-8"

Hi Kuwan-Wei,

On Sun, 27 Sept 2026 at 22:55, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> Add a BPF JIT compiler for the m68k architecture.
>
> The JIT generates m68k machine code targeting m68020+ processors and
> coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> and non-mmu coldfire processors, as it relies on 32-bit branch
> displacements (b<cc>.l) to handle large bpf programs.
>
> Tested with the test_bpf.ko:
> test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
>
> Tested-by: Daniel Palmer <daniel@thingy.jp>
> Co-developed-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Changes in v6:
> - Fix kconfig sort order for HAVE_EBPF_JIT.
> - Update eBPF-JIT/arch-support.txt

Thanks for the update!

Are any of the issues raised by the bpf-ci bot valid?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
