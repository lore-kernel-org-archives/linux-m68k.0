Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290582698BC
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 08:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642458; cv=none; b=HP0KkOcgnj0uHKcnRsKiYjNpEtUGoQxyhQYYpq6abgDiP9HxUynSSd91b8zyq6DPlYQuSxdiD8/28vt3XQPNPtAD8n1vdyJUcRQSjXc7j8fTXCDIhct4/JipmkJzP4RuqlYXADIxVBdXJS0XMMkRI1y7iTXuZPbvahP6HRx1IeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642458; c=relaxed/simple;
	bh=utvshoq/aaq90aGZ+gX56mY9VSSo5RYpwROKbr4Xfso=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qqHy9epvC/zvBq8GfW3OB2NeJoWQ53oR8KUfEcwMTDS8Vo40rZY4zDQYEVvh6eaIPiWgkbdoXWUq018EIbqBvxt+mA0lnS2uXNTG0SznXl7nmkuZ+p9nCmYmQQGOhtFwdGN3Z6mdTAWNWtAuxJKXAK1afkVj5Yl+UKqk+O1ZcCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XYi5qcJo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XYi5qcJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747642454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VncchEadz39g03PGfBzHIbsF8E9JFPFFhBi849ltTbo=;
	b=XYi5qcJo++WaOpUe5itGAunuRE8uVHqnZC3QTCHNmDRAyt29GwzwHPpxaFDcewquVLlB/H
	4IBAtzZglv3EPTsEFOdEh8GG8EcIg7UkQB74A3sZCYzvcaegNerUmgDKGSsSA845ma0/lZ
	WRv6z6az09cUdOWjLS1F5F8Inj8miM4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-ByqWt_iCPoOS_qVrcmQ7TQ-1; Mon,
 19 May 2025 04:14:11 -0400
X-MC-Unique: ByqWt_iCPoOS_qVrcmQ7TQ-1
X-Mimecast-MFC-AGG-ID: ByqWt_iCPoOS_qVrcmQ7TQ_1747642450
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C76D91955DAB;
	Mon, 19 May 2025 08:14:09 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.247])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1C0819560AB;
	Mon, 19 May 2025 08:14:07 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: John Paul Adrian Glaubitz via Libc-help <libc-help@sourceware.org>
Cc: James Le Cuirot <chewi@aura-online.co.uk>,  John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>,  debian-68k <debian-68k@lists.debian.org>,
  linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Tuple and changes for m68k with -malign-int
In-Reply-To: <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	(John Paul Adrian Glaubitz via Libc-help's message of "Sun, 18 May
	2025 09:09:19 +0200")
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	<08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
Date: Mon, 19 May 2025 10:14:04 +0200
Message-ID: <8734d1kofn.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

* John Paul Adrian Glaubitz via Libc-help:

> I was just looking at the necessary changes to switch m68k to 32-bit alignment
> and I'm not sure we need to do anything about glibc. I am documenting my current
> findings here [1].

>> [1] https://wiki.debian.org/M68k/Alignment

Why doesn't this change need a new target triple?  This change alters
struct layout (it introduces new padding in some cases), so it's quite
incompatible with what we have today.

Thanks,
Florian

