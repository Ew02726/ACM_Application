﻿using GSUACM.Models.ChatModels;
using GSUACM.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Text;
using System.Windows.Input;
using Xamarin.Forms;

namespace GSUACM.ViewModels.ChatViewModels
{
    class ChatPageViewModel : INotifyPropertyChanged
    {
        public INavigation Navigation { get; set; }
        public ICommand BackCommand { get; private set; }
        public ObservableCollection<Message> Messages { get; set; } = new ObservableCollection<Message>();
        public string TextToSend { get; set; }
        public ICommand OnSendCommand { get; set; }
        public ChatPageViewModel(INavigation navigation, string id, bool isChannel)
        {
            this.Navigation = navigation;
            BackCommand = new Command(CloseModal);

            UpdateChat(id, isChannel);

            OnSendCommand = new Command(() =>
            {
                if (!string.IsNullOrEmpty(TextToSend))
                {
                    if(isChannel)
                        Messages.Insert(0, new Message() { text = TextToSend, alias = App.User, channel = id });
                    else
                        Messages.Insert(0, new Message() { text = TextToSend, alias = App.User, roomId = id });
                    TextToSend = string.Empty;
                }

            });
        }
        public void UpdateChat(string id, bool isChannel)
        {
            //TODO: get chat data from API
            //if(isChannel)
            //    Messages = new ObservableCollection<Message>(MockIncomingMessage.GetChannel(id));
            //else
            //    Messages = new ObservableCollection<Message>(MockIncomingMessage.GetChat(id));

            Messages.Insert(0, new Message() { text = "Hi" });
            Messages.Insert(0, new Message() { text = "How are you?", alias = App.User });
            Messages.Insert(0, new Message() { text = "What's new?" });
            Messages.Insert(0, new Message() { text = "How is your family", alias = App.User });
            Messages.Insert(0, new Message() { text = "How is your dog?", alias = App.User });
            Messages.Insert(0, new Message() { text = "How is your cat?", alias = App.User });
        }

        public void CloseModal()
        {
            Messages = null;
            MockIncomingMessage.ClearChat();
            MockIncomingMessage.ClearChannel();
            Navigation.PopModalAsync();
        }

        public event PropertyChangedEventHandler PropertyChanged;
    }
}
