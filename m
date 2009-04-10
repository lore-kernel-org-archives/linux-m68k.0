From: Jan Ceuleers <jan.ceuleers@computer.org>
Subject: Re: [PATCH 1/6] ariadne: convert to net_device_ops
Date: Fri, 10 Apr 2009 18:13:54 +0200
Message-ID: <49DF7042.7090502@computer.org>
References: <20090410032407.GA9004@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay012.isp.belgacom.be ([195.238.6.179]:48727 "EHLO
	mailrelay012.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758721AbZDJQON (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 10 Apr 2009 12:14:13 -0400
In-Reply-To: <20090410032407.GA9004@orion>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org

Alexander Beregalov wrote:
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
...
> @@ -197,13 +209,8 @@ static int __devinit ariadne_init_one(struct zorro_dev *z,
>      dev->mem_start = ZTWO_VADDR(mem_start);
>      dev->mem_end = dev->mem_start+ARIADNE_RAM_SIZE;
>  
> -    dev->open = &ariadne_open;
> -    dev->stop = &ariadne_close;
> -    dev->hard_start_xmit = &ariadne_start_xmit;
> -    dev->tx_timeout = &ariadne_tx_timeout;
> +    dev->netdev_ops = &ariadne_netdev_ops;;

We don't really need two semicolons there but I suppose that they won't 
hurt.

Cheers, Jan
