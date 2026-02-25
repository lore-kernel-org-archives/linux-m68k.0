Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8625138F92C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Feb 2026 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772013857; cv=pass; b=vEuaphBQ8pSL8B0lDIgUbOykUzjFkYNRSatD4dNnrxejO0tWaiAXq/S+puY/A9IyxGp34O1bbWhlpjPpTwfp4JqJH4uRHFbX2k4tiP5IjjOwPuukDp2zBRf7K/XlXWm0WOSbuEypkD86f+s0KwVNLYQ5rYnv/qJE39glAhTmInM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772013857; c=relaxed/simple;
	bh=yCrXMw/Dj+hqzlN+LWceZElK0Bq9p7IjFsDati7baIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oqk3BeM1M4YhLlHiZnTgVScOVFN+FJ0mbfotmgmgr3F8Pl7R9qHqpw/8HVRugb34wpQLs++CNqck81t7j+wfQgt1iJZqy72q5LJ53ZDG9/CWoVPyzC7KiliIU+EnhoJCZUCg0rpeR1EQbyMjdl4Mlae7pUziFoBehAt7CX7ZcKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=EEvpQS9a; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="EEvpQS9a"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35658757f68so2755568a91.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Feb 2026 02:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772013855; cv=none;
        d=google.com; s=arc-20240605;
        b=Ztv73nuQNf+zcMjRDE9IwLH4fzuE7DixipgCrgMPqc5D4i19kKryW5iEQqGx4z2vWj
         RQ+Y83zxiOZJ0EpUNVt6KCAqC0+ipIL+l9oTTiTYsGDepknc1RL/oHGIIHC5+tKOWR6j
         LXuwR4X5CLZTKjJgrRtP2r5pKqFbOMGCWS57vsHmI4fs+ugdnPUaZyl7yVN0hQM4gEF8
         duaDUidxGGewNc8VzgNAx6y0Vj65VsZzlGFQJ4hC1MLE2VjWni9k1L3/Dba+m8U1rnet
         mszp2z3bI+i1hFjPncmCQ5ItuvyGR5xyxhskNSYH+x5LLfLTcxKs5FHdA/LZ1dLv2TNh
         tarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yCrXMw/Dj+hqzlN+LWceZElK0Bq9p7IjFsDati7baIU=;
        fh=ONxbIAMuiQaHTSJtpxyl0LRER5UhlgAGQvhq2yv9ujA=;
        b=XRF7SFNzKGZ/GiXNiZaoY3uMNDZZMrw4oBWaA6iIJGsinZ8rcLVKx4XIeqaXTWPLx9
         28L0IrXnmzGbrkQC4opTYDLqf6N6WX5JwwDCF44BhYivOdrCWgPijtVoYyrdi+Ujupjq
         oLn6qIqJYEXJeDh4fOyYNJXeFRrEk27y3k/0sj4glvooxuYjq+fmZgwTclEFD3Ge5SIi
         uhT4iAOysYzafhVO+cO1p4qd0W6qaQ+hRy8ZhN+Rkq9gg+UlfQGa2RiWTk8LS3cV+GQA
         KQ04w8RWABHn5u2YH196hkO3oGTEAvl6JsgHiQvqhasT8sYeG9JtDqF0HuYMa4vM8CWG
         QMTg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1772013855; x=1772618655; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yCrXMw/Dj+hqzlN+LWceZElK0Bq9p7IjFsDati7baIU=;
        b=EEvpQS9aSvjdlYDbA3dDmYh41f/Uuv9XCbS+mBN6oj06NSHIy5HyD+Szpc67Tnbf4G
         G39PdlfP5l/T+0xenvvZd/AxFKKT8VDd/OHrhS9CeB/Rm3N/1T9TkPCHNfi5U8uEJi3Z
         oDflc6RZ0ioU7hVo/bUeeE+NFWU/5YOkMPUlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772013855; x=1772618655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCrXMw/Dj+hqzlN+LWceZElK0Bq9p7IjFsDati7baIU=;
        b=ZDVZgk2D2s7HANqgINYstrdvP8dajg1lYDmUlfkaIvANSzrqWEV/wTSsymLWX1+kyC
         Y/obSc8VksAaZ8k/tDa/qZmYJTy55090c3OC5W4DSzFOUpi/R0c3KW8fh8BJA/bfypcs
         kxYnWK5OZCVxVDcmV6YotqXdA5T6oYGuA8T1wpPoudrytGO1myr/pYkTfnt2i0wz2OH4
         JhD5lMwEAsQPAs4KczEbSY+sMY/tFJMt3/bacYExjyqmmnF1PcezImbfPsgm6O2qZvhl
         EfPO0YZeW68qrMFhbzXqBLBCAktl/7rJdiThGT5N7T0LU+RL3z54N2LdaQLf/ChVwSLK
         68Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWFZoldlyomP32u/qrNiBWHSHE3XdPaiEOypzPOBvQt9lSAHvkLDXHF4T+ofoeSHhZT+a+778SA004C@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyopF9g4v7ZJAN9zBzvi11LuU9fTTjKbbB1wc+XpzDX8O+2i4tY
	K0NOrP+B/u+r+ITyPwXN5yzQlq5kts12mZT4xEPlHqGQlJYRLNL3SGlMWo+gjaKxFOU1Lw5QVyB
	eMdQt+5FSRnJzi+oK5/jLWIautSiRXMYU24hlLsgYSg==
X-Gm-Gg: ATEYQzw9GM7xUniO6KQ7sv9KG2hZaITrD8PiqR7gsp6hATxLwJjtI5CuJkzrsITKrUi
	7whYAmQIcRvBuMlPPILNgYn5FGUWnXRBzyIiLlKVvTlkJza3tadTsREFpfSkuK+mi7xcJrf2/z8
	ujdvXnD7zbqNTY8kZTPoJ3fk8tNPOPnYSjzN0xeyEkvKwi7rmdt+2Ws0+gRf9wFMQ0uDFPvu6/2
	qGRUIA4xYgMav7TX80XhEa9yq1Nz9u09EZ34hqYxbsIFIfBlte2GLHhp+JgB8wByuT1+BX21Pho
	5/SyV8fgs5beWvfvWqw=
X-Received: by 2002:a17:90b:2d4b:b0:356:2132:67bf with SMTP id
 98e67ed59e1d1-3590f13c381mr1845762a91.18.1772013854787; Wed, 25 Feb 2026
 02:04:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213120401.3992567-1-daniel@thingy.jp> <CAMuHMdWqFfusk_23FBX0YcrkhygjcN=DX25ys6cDyP1_ja2qmQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWqFfusk_23FBX0YcrkhygjcN=DX25ys6cDyP1_ja2qmQ@mail.gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Wed, 25 Feb 2026 19:04:04 +0900
X-Gm-Features: AaiRm53NzMd7FqC-hqgKwrgxG3nRPyJ8y9AYBBxCectwq2gV1-aHMJEPGMxctbI
Message-ID: <CAFr9PXmvXhBTxuhpuseZK--Ja7Tq7=UKUKTUJDQHBEBGJthXzg@mail.gmail.com>
Subject: Re: [PATCH] m68k: nommu: fix memmove() with differently aligned src
 and dest for 68000
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

On Tue, 24 Feb 2026 at 19:32, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Ideally, these (and the few existing other checks) should check for
> CONFIG_CPU_HAS_NO_UNALIGNED instead.

That makes sense. I have a few other bits to make 68000 support work
properly again that I will send eventually.
If I remember I'll send a patch with some of that to
s/CONFIG_M68000/CONFIG_CPU_HAS_NO_UNALIGNED/ for these functions.

Thanks,

Daniel
