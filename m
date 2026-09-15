Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353654A99B9
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 22:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512918; cv=none; b=bKLq4vrA0qFTw7Qb2nX9VGkZlqlEVOS58DUdVbHai7NW2XwInjOwAdtSr7k/+YaWsnppDLJaTseE0AtnKuGd2PFr278/7hLUGB+WC+dIwgOoHaLh7Tvy4pYD/JzY/aKOnF8tnztXV/Zbi9dj/eSSADda6BgxGONV/1/9WeHec/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512918; c=relaxed/simple;
	bh=ITz7hBythv5OWTbmQ9c4e1mzRPysX2+YTMbCrseTj6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+olP/kGuX0yech4112j4MWeniuyA3Gl5pljWy+Xgoi04lcYtpYi5GzkAxo2IPJ4mAV9SrnQLkgNr+xS8BWS7zJ1ep4KPqCXkYBTy4W+QkCPzI8BONAXbxBsVKcvBk+NZwQMF64049J3aBTwtjpbGmAzQYt94DEQs2KBjpF4YLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PcFZgdL3; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PcFZgdL3"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a56so55375766b.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 15:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789512915; x=1790117715; darn=lists.linux-m68k.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=PcFZgdL3V7RL4Tkl1niRPzgdGEYIzF7FTSYD8zTuEBsgP1PrXHgfPqV5fWebo+4u1F
         6/d1uqWOGBfOU+qYZxqR6DDk58Q7t7sEXHVNTVobboGCVBIVc5td17BmcVmx6oCekuUr
         hMNeKp3JQVkomv2e3EiyDiUdefYaP6Ac1bm+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789512915; x=1790117715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=RL2g5IzvPPyxlsYZyB1Sq/lvTLsnYm7EzlfOV2kAqkOZH3Y0j28d5x36sK5gj/2pfK
         2iaeUJk7O4yLp+PiHdGpCT5V92LqeSKs4G7zwg5AesLTWlCfW+u2EU2ALYMYaoo/Lr1b
         vbeODvUr3A2CT0S5I7Ws51Rd8etg1lcmuGqBq4gd2QdHpesu3+562joqXb9XaZptkeZA
         7hkRAFRamDOqe0Z5xE1QYrqAkvoUMt/IDtbtBvuxSQ9rb0BigMvSX1G1LT0FyOKcp/xg
         g2ZCh1z7hpOrwF073GJ5o62YYvBKvNJ3NI8449eMkUsTikiKARdPGA23g8jlUVBqvP+V
         hCKg==
X-Forwarded-Encrypted: i=1; AKwUvBxBm3ibj7Pjhd+PKOcGltBApmymlFMFi1r7CKCBw+sKhfr6R2DHdI/z7OU0zJlfl/hBHV4+hM4d6Qnf@lists.linux-m68k.org
X-Gm-Message-State: AFuF++nzhPTy+7VtU/iCRqW0c+DCIGvHdNffdJMlAtG2l8LmMsYR7tbs
	GJSzktnW7Q7jQwc9ZZ08nke5Yy371S+bncdI6ale5lfX2jQVaQSAlPkguVRJW7o+RoJs7za9Q33
	7YADI2eJSzw==
X-Gm-Gg: AYBFou0AgmirQeYArdlGPygPDAUiIKtS45uJijGvqvPBzAgq4cDUkw00pI7kBXubSP/
	NJaBoCPsN7FNHdnNf4Ae1rTX6085qpj22GfOm0Z5B2SxZvOdiudirV2vNEiVRymtECOV+BzC84y
	5ERnu+7yZROYcCe+yuk6dSWRBYpDRjme+CwqgFepEURpMGiopbsOrlbBmCcXwu3c72p++PG41JF
	WcPbCE+IAfD3YZ3+tiaOujoJoNQpMFZmqOYxCiPsgVIH/uUidJdwMoiiyq3KsPqin11X5XKMVFQ
	iQbj+0ITTcKRNP0Ue/Npvu4MPiJDiBRtvBO0nPqRhnepo4GAHnIu3tiVH7OxIZcdwY2Zm5PdcNC
	G6wd6YNg0JgByy7s1l/b9ixRggxzdQUWk5NUWMnee3m+i2gLMH2SO5sKWe9bWR/zkVHUFsR4GLK
	r5CqGqQTejJcme0o74qjJOIVvtxfyF2nwvzgyJUtvyCyZRT1PUXoWrdx5gAy7+hwZzAQdmqiskk
	LMh/br1L0E6a9UEeKfSCeUaREf6pP3QHYANOB4vjNMlvrt4
X-Received: by 2002:a17:906:4fc5:b0:c26:1649:47b4 with SMTP id a640c23a62f3a-c29e5317d1dmr7681866b.42.1789512915561;
        Tue, 15 Sep 2026 15:55:15 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de4add55sm33569366b.33.2026.09.15.15.55.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so457266a12.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQM6Mv+DwEQt1HmeErQKLfpNv8PugUaHTppK8U8mUJVKK3Ik2pm34Odo4FTAEt8iNaUi5Cz6Pj2AUM@lists.linux-m68k.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus
